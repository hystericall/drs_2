class Division < ApplicationRecord
  has_many :users

  validates :name, length: {maximum: Settings.max_length}, presence: true,
    uniqueness: {case_sensitive: false}, allow_nil: true

  scope :descending, ->{order(created_at: :desc)}
end
