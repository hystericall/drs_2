class Request < ApplicationRecord
  belongs_to :user
  enum status: %i(pending approved disapproved)
end
