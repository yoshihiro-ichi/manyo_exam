class TasksController < ApplicationController
  def index
   @tasks = Task.all
  end

  def show
  end
end
