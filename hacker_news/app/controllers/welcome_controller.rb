class WelcomeController < ApplicationController
  def index
    # @posts = Post.all
    #  go to the welcome#index view and show ALL posts from everyone
    @posts = Post.all
  end
end
