class Request < ApplicationRecord
  enum status: %i(pending approved disapproved)
  enum request_type: %i(dateoff il le)

  belongs_to :user
  delegate :name, to: :user

  validates :user_id, presence: true
  validates :request_type, presence: true
  validates :date, presence: true
  validates :time, presence: true, allow_nil: true
  validates :offset_time_start, presence: true, allow_nil: true
  validates :offset_time_end, presence: true, allow_nil: true
  validates :offset_date, presence: true, allow_nil: true
  validates :content, presence: true, length: {maximum: Settings.maximum_content}

  scope :descending, ->{order(created_at: :desc)}
  scope :increasing, ->{order :created_at}
  scope :find_user_id_in_db, ->(id, following_ids){where "user_id IN (?) OR user_id = ?", following_ids, id}
  scope :find_pending_request, ->(id){where "status = 0 AND user_id IN (?)", id}

  def approve_request
    update_attributes status: 1
  end

  def disapprove_request
    update_attributes status: 2
  end
end
