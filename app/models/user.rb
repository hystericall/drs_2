class User < ApplicationRecord
  enum role: %i(user manager admin)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  attr_accessor :remember_token

  belongs_to :division
  belongs_to :position
  has_many :requests
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

  def forget
    update_attributes remember_digest: nil
  end
end
