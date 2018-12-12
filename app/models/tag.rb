class Tag < ApplicationRecord
  has_and_belongs_to_many :todos, join_table: :hashtags
end
