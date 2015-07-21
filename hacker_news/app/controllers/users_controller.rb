class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    # Move line 10 to within the if statment b/c there's no id on user yet since it hasn't saved.
    session[:user_id] = user.id
    if user.save
      redirect_to user_posts_path(user.id)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :password)
    end
end
