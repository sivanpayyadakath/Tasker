class TodosController < ApplicationController

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:success] = "new task  created"
      redirect_to todos_path
    else
      render 'new'
    end
  end

  def index
    if params[:order] == 'created'
      @todos = Todo.all.order("created_at")
    elsif params[:order] == 'all'
      @todos = Todo.all.order("created_at DESC ")
    else
      @todos = Todo.all.order("created_at DESC")
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      flash[:success] = "task updated"
      redirect_to todos_path
    else
      render 'edit'
    end
  end


  def destroy
    Todo.find(params[:id]).destroy
    flash[:danger] = "task done"
    redirect_to todos_path
  end


  def task_completed
    puts @todo = Todo.find(params[:id])
    if @todo.update_attribute(:done, true)
    redirect_to todos_path
    end
  end

private
  def todo_params
    params.require(:todo).permit(:content, :title)
  end
end

