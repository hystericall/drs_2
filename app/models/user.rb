class User < ApplicationRecord
  enum role: %i(user manager admin)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  attr_accessor :remember_token, :activation_token

  belongs_to :division
  belongs_to :position
  has_many :requests, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name:  Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :email, format: {with: VALID_EMAIL_REGEX},
  length: {maximum: Settings.max_length},
  presence: true, uniqueness: {case_sensitive: false}
  validates :name, length: {maximum: Settings.max_length}, presence: true
  validates :password, length: {minimum: Settings.min_length}, presence: true,
  allow_nil: true
  validates :skill, length: {maximum: Settings.max_length}, presence: true
  validates :user_code, length: {maximum: Settings.max_length}, presence: true
  validates :position_id, presence: true
  validates :division_id, presence: true

  scope :lastest, ->{order(created_at: :desc)}
  scope :by_user_name, ->(user_name){where("name like ?", "%#{user_name}%") if user_name.present?}
  scope :by_user_code, ->(user_code){where("user_code like ?", "%#{user_code}%") if user_code.present?}
  scope :in_division, ->(division_id){where("division_id like ?", division_id.to_s)}
  scope :in_position, ->(position_id){where("position_id like ?", position_id.to_s)}

  before_create :create_activation_digest
  before_save ->{self.email = email.downcase}

  has_secure_password

  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  def requestfeed
    following_ids = following.map(&:id)
    Request.find_user_id_in_db id, following_ids
  end

  def forget
    update_attributes remember_digest: nil
  end

  def activate
    update_attributes activated: true, activated_at: Time.zone.now
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

  def in_division_of? division
    division == division_id
  end

  private

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest activation_token
  end
end
