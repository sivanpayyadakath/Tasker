class TodosController < ApplicationController

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:success] = 'new task  created'
      redirect_to todos_path
    else
      render 'new'
    end
  end

  def index
    @q = Todo.ransack(params[:q])
    @todos = @q.result(distinct: true)
    # @todos = if params[:order] == 'created'
    #   Todo.reorder('created_at ASC')
    #          elsif params[:order] == 'deadline'
    #   Todo.reorder('deadline_at ASC')
    #          else
    #   Todo.all
    #          end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      flash[:success] = 'task updated'
      redirect_to todos_path
    else
      render 'edit'
    end
  end


  def destroy
    Todo.find(params[:id]).destroy
    flash[:danger] = 'task done'
    redirect_to todos_path
  end


  def task_completed
    puts @todo = Todo.find(params[:id])
    if @todo.update_attribute(:done, true)
      @todo.update_attribute(:completed_at, Time.now)
      @todo.update_attribute(:status, 'completed')
      redirect_to todos_path
    end
  end

  def task_started
    puts @todo = Todo.find(params[:id])
    if @todo.update_attribute(:status, 'underway')
      # @todo.update_attribute(:started_at, Time.now)
      redirect_to todos_path
    end
  end


private
  def todo_params
    params.require(:todo).permit(:content, :title, :deadline_at, :status, :search)
  end

end

