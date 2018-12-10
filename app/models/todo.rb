class Todo < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 250 }
  default_scope -> { order(created_at: :desc) }
  validate :deadline_at_cannot_be_in_the_past
  paginates_per 6
  belongs_to :user
  has_and_belongs_to_many :tags, join_table: :hashtags

  def deadline_at_cannot_be_in_the_past
    if deadline_at.to_i < Time.now.to_i
    errors.add(:deadline_at, "can't be in the past")
    end
  end

  def self.search(search)
    where("title LIKE?", "%#{search}")
  end

end