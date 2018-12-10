class AddIndexToTags < ActiveRecord::Migration[5.1]
  def self.up
    add_index :tags , :name
  end
end
