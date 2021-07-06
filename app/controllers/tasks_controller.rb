class TasksController < ApplicationController
before_action :set_task, only:[:show,:edit,:destroy,:update]
  def index
    if params[:sort_deadline]
      @tasks = Task.all.order(deadline: :desc)
    else
      @tasks = Task.all.order(created_at: :desc,)
    end
  end
  def new
  @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save
       redirect_to tasks_path, notice: "ブログを作成しました！"
    else
       render :new
    end
  end
  def show
  end

  def edit
  end

  def update
        if @task.update(task_params)
        redirect_to task_path, notice: "ブログを編集しました！"
      else
        render :edit
      end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path,notice:"ブログを削除しました！"
  end

  private
  def task_params
    params.require(:task).permit(:name,:content,:deadline)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
