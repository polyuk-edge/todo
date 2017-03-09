class UserTodo < ActiveRecord::Base
  validates :body, presence: true
end
