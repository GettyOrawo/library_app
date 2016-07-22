class Book < ApplicationRecord
  attr_accessor :books
  belongs_to :user
  default_scope -> { order(created_at: :desc)  }
  enum bookstatus: { unavailable: 0, available: 1 }
  enum whereabouts: { returned: 0, misplaced: 1, borrowed: 2 }
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 30}
  validates :author,presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
end
