class Todo < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 250 }
  default_scope -> { order(created_at: :desc) }
  validate :deadline_at_cannot_be_in_the_past
  paginates_per 9

  def deadline_at_cannot_be_in_the_past
    if deadline_at < Time.now
    errors.add(:deadline_at, "can't be in the past")
    end
  end

  def self.search(search)
    where("title LIKE?", "%#{search}")
  end

end