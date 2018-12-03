class AddDeadlineAtToTodo < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :deadline_at, :datetime
  end
end
