class PostsController < ApplicationController

  def index

    # Just be posts from one user (params[user:id])
    require_login
    @user = User.find_by_id(session[:user_id])
    # CN: @author = @post.user < -- This avoids the database hit you get on line 9.
    @author = User.find_by_id(params[:user_id])
    # CN: Use @post since you're finding a single post.
    @posts = Post.find_by_id(params[:id])
  end

  def new
    require_login
    @user = User.find_by_id(params[:user_id])
    @post = Post.new
  end

  def create
    require_login
    @user = User.find_by_id(params[:user_id])
    @post = Post.new(post_params)
    @post.user = @user
    if @post.save
      redirect_to user_posts_path(@user)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_user_post_path
    end
  end

  def show
    require_login
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(params[:user_id])
  end

  private
    def post_params
      params.require(:post).permit(:title,:content)
    end
end
