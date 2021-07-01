class TasksController < ApplicationController
  def index
   @tasks = Task.all
  end

  def show
  end
  private
  def task_params
    params.require(:task).permit(:content)
  end
end
