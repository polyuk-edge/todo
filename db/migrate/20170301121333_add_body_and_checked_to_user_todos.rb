class AddBodyAndCheckedToUserTodos < ActiveRecord::Migration
  def change
    add_column :user_todos, :body, :string
    add_column :user_todos, :checked, :boolean, :default => false
  end
end
