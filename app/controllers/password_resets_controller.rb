class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t "users.notice_email"
      redirect_to root_url
    else
      flash.now[:danger] = t "users.notice_email!"
      render "new"
    end
  end

  def new; end

  def edit; end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, t("password_resets.empty!"))
      render "edit"
    elsif @user.update_attributes(user_params)
      log_in @user
      @user.update_attribute(:reset_digest, nil)
      flash[:success] = t "password_resets.success"
      redirect_to @user
    else
      render "edit"
    end
  end

  private

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless @user&.activated? &&
           @user.authenticated?(:reset, params[:id])
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def check_expiration
    return true if @user.password_reset_expired? == false
    flash[:danger] = t "password_resets.expired"
    redirect_to new_password_reset_url
  end
end
