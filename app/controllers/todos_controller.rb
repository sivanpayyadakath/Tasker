class TodosController < ApplicationController
  before_action :require_login
  before_action :correct_user

  def new
    @user = User.find(params[:user_id])
    @todo = @user.todos.new
  end

  def create
    @user = User.find(params[:user_id])
    @todo = @user.todos.create(todo_params)
    @tags = params[:tags].scan(/#\w+/)

    @tags.each do |tag|
      tag.slice!(0)
      if Tag.exists?(name: tag)
        obj_tag = Tag.find_by(name: tag)
        unless @todo.tags.include?(obj_tag)
          @todo.tags << obj_tag
        end
      else
        @todo.tags.create(name: tag)
      end
    end

    if @todo.save
      flash[:success] = 'new task  created'
       redirect_to user_todos_path
     else
       render 'new'
    end
  end

  def index
    @user = current_user
    @q = @user.todos.ransack(params[:q])
    @todos = @q.result(distinct: true).page params[:page]
    # if params[:search]
    #   @tags = Tag.all.where('name LIKE ?', "%#{params[:search]}")
    #   @todos = @user.todos
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
    redirect_to user_todos_path if @todo.update_attribute(:status, 'underway')
  end


  # def search
  #   if search
  #     .where(['name LIKE ?', '%#{search}'])
  #   else
  #     all
  #   end
  # end

private

  def todo_params
    params.require(:todo).permit(:content, :title, :deadline_at, :status, :priority)
  end

  def require_login
    if current_user
      @user = @current_user
    else
      flash[:danger] = "please log in"
      redirect_to login_url
    end
  end


  def correct_user
    @user = User.find(params[:user_id])
    if !current_user?(@user)
      redirect_to user_todos_path(current_user)
    end
  end

end

