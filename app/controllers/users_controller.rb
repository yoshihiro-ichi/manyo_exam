class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :ensure_correct_user,only:[:show]

  def show
    @user = User.find(params[:id])
    @tasks = Task.all
    redirect_to new_session_path unless current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      #  ここに追記
      redirect_to user_path(@user.id)
      flash[:notice] = 'ログインしました'
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def ensure_correct_user
    if current_user.id != params[:id].to_i
       redirect_to tasks_path
    end
  end
end
