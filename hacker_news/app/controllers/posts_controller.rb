class PostsController < ApplicationController

  def index
    require_login
    @user = User.find_by_id(params[:user_id])
    @posts = Post.all
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

  private
    def post_params
      params.require(:post).permit(:title,:content)
    end
end
