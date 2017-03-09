class CreateUserTodos < ActiveRecord::Migration
  def change
    create_table :user_todos do |t|
      t.timestamps null: false
    end
  end
end
