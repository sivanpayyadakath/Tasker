class TodosController < ApplicationController

  def create

  end

  def index
    @todos = Todo.all
  end


private
  def todo_params
    params.require(:todo).permit(:content)
  end
end
