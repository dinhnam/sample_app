class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy]
  def index
    @users = if current_user.admin?
               User.paginate(page: params[:page])
             else
               User.where(activated: true).paginate(page: params[:page])
             end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    redirect_to(root_url) && return unless @user
  end

  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      @user.send_activation_email
      flash[:info] = t "users.notice"
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes user_params
      flash[:success] = t "users.edit.updated"
      redirect_to edit_user_url
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t "users.deleted"
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = "Please log in."
    redirect_to login_url
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
