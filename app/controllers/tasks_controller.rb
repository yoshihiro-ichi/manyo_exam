class TasksController < ApplicationController
before_action :set_task, only:[:show]
  def index
   @tasks = Task.all
  end

  def new
  @task = Task.new
  end

  def create
  Task.create(task_params)
  redirect_to tasks_path,notice:"タスクを作成"
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
