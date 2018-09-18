class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build micropost_params

    if @micropost.save
      flash[:success] = t "users.success"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate page: params[:page]
      render "static_pages/home"
    end
  end

  def destroy
    @micropost.destroy

    if @micropost.destroyed?
      flash[:success] = t "users.destroy"
    else
      flash[:danger] = t "users.destroy!"
    end
    redirect_to request.referrer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit :content, :picture
  end

  def correct_user
    redirect_to root_url unless @micropost = current_user.microposts.find_by(id: params[:id])
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "users.login!"
    redirect_to login_url
  end
end
