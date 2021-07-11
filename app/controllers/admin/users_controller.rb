class Admin::UsersController < ApplicationController
  before_action :if_not_admin
    before_action :set_user, only: [:show, :edit, :destroy]
    def new
       @user = User.new
     end

     def index
       @users = User.all.order("created_at ASC").includes(:tasks)
       @users = @users.page(params[:page]).per(8)
     end
  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_yser
    @user = User.find(params[:id])
  end
end
