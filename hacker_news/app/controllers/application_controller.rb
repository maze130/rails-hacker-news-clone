class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    @user = User.find_by_id(params[:user_id])
    !!session[:user_id]
  end

  def require_login
    unless logged_in?
      flash[:notice] = "You must be logged in to view this page."
      redirect_to login_path
    end
  end
end
