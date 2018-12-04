class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.text :content

      t.timestamps
    end
    add_index :todos, :user_id
  end
end
