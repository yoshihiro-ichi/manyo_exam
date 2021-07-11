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

     def create
       @user = User.new(user_params)
       if @user.save
         redirect_to admin_users_path, notice: "作成完了"
       else
         render :new
       end
     end

     def edit
      end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end
end
