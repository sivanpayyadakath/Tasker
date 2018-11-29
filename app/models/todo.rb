class Todo < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 250 }
  default_scope -> { order(created_at: :desc) }
end
