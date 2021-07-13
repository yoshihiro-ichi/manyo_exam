class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  before_action :set_user, only: [:show, :edit, :destroy,:update]
  def new
     @user = User.new
   end

   def index
     @users = User.all.includes(:tasks)
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

  def update
    
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "更新完了"
      elsif @user.errors.any?
        render :new
      else
        redirect_to admin_users_path, notice: "最後の管理者です、消せません"
      end
  end

  def show
    @tasks = @user.tasks
  end

  def destroy
    if @user.destroy
     redirect_to admin_users_path, notice: "削除完了"
   else
     redirect_to admin_users_path, notice: "最後の管理者です、消せません"
   end
  end


  private
  def user_params
      params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation )
  end

  def if_not_admin
    redirect_to root_path,notice: "管理者以外はアクセスできません" unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end
end
