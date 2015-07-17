class CommentsController < ApplicationController

  def new
    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = User.find_by_id(session[:user_id])
    @author = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    @comment.user_id = @user.id
    if @comment.save
      redirect_to user_post_path(@author.id,@post.id)
    else
      redirect_to new_user_post_comment_path
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
