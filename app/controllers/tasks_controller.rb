class TasksController < ApplicationController
before_action :set_taso, only:[:show]
  def index
   @tasks = Task.all
  end

  def show
  end

  private
  def task_params
    params.require(:task).permit(:name,:content)
  end
  def set_task
    @task = Task.find(params[:id])
  end
end
