class TodosController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @todo = @user.todos.new
  end

  def create
    @user = User.find(params[:user_id])
    @todo = @user.todos.create(todo_params)
    if @todo.save
      flash[:success] = 'new task  created'
      redirect_to user_todos_path
    else
      render 'new'
    end
  end

  def index
    @user = User.find(params[:user_id])
    @todos = @user.todos
    # @q = User.includes(:todos).ransack(params[:q])
    # @todos = @q.result(distinct: true).page params[:page]
  end

  def edit
    @user = User.find(params[:user_id])
    @todo = @user.todos.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @todo = @user.todos.find(params[:id])
    if @todo.update_attributes(todo_params)
      flash[:success] = 'task updated'
      redirect_to user_todos_path
    else
      render 'edit'
    end
  end


  def destroy
    @user = User.find(params[:user_id])
    @user.todos.find(params[:id]).destroy
    flash[:danger] = 'task done'
    redirect_to user_todos_path
  end


  def task_completed
    @user = User.find(params[:user_id])
    @todo = @user.todos.find(params[:id])
    if @todo.update_attribute(:done, true)
      @todo.update_attribute(:completed_at, Time.now)
      @todo.update_attribute(:status, 'completed')
      redirect_to user_todos_path
    end
  end

  def task_started
    @user = User.find(params[:user_id])
    @todo = @user.todos.find(params[:id])
    if @todo.update_attribute(:status, 'underway')
      redirect_to user_todos_path
    end
  end


private
  def todo_params
    params.require(:todo).permit(:content, :title, :deadline_at, :status, :priority)
  end

end

