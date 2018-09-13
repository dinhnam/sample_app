class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      login_remember user
    else
      flash[:danger] = t "sessions.danger"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
  def login_remember user
    if user.activated?
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_back_or user
    else
      message = t "users.notice_again"
      flash[:warning] = message
      redirect_to root_url
    end
  end
end
