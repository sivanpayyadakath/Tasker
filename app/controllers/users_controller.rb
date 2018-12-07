class UsersController < ApplicationController
  before_action :require_login
  # before_action :not_logged_in, only: [:index ,:show, :destroy, :make_admin]
  before_action :admin_user, only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Account succesfully created"
      redirect_to user_todos_path(@user.id)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "profile update succesfully"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def make_admin
    @user = User.find(params[:user_id])
    if @user.update_attribute(:admin, true)
      flash[:success] = "admin added succesfully"
      redirect_to users_path
    end
  end

  def remove_admin
    @user = User.find(params[:user_id])
    if @user.update_attribute(:admin, false)
      flash[:success] = "admin removed succesfully"
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_login
    unless current_user
      flash.now[:danger] = "please log in"
      redirect_to login_url
    end
  end

  def not_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
