class TodosController < ApplicationController

  def index
    @active_todo_count = UserTodo.where(checked: false).count
    if params[:query] == 'completed'
      @todos = UserTodo.where(checked: true).order('id')
    elsif params[:query] == 'active'
      @todos = UserTodo.where(checked: false).order('id')
    else
      @todos = UserTodo.all.order('id')
    end
  end

  def create
    @todo = UserTodo.new(todo_params)
    @todo.save
    redirect_to todos_path
  end

  def destroy
    @todo = UserTodo.find_by(id: params[:id]).destroy
    redirect_to todos_path
  end

  def destroy_all
    @todos = UserTodo.where(checked: true).destroy_all
    redirect_to todos_path
  end

  def check_all
    @todos = UserTodo.where(checked: false)
    if @todos.empty?
      UserTodo.update_all(checked: false)
    else
      UserTodo.update_all(checked: true)
    end
    redirect_to todos_path
  end

  def update
    @todo = UserTodo.find_by(id: params[:id])
    @todo.update(checked: !@todo.checked)
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:body)
  end

end
