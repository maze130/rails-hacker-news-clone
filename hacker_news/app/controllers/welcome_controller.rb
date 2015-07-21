class WelcomeController < ApplicationController
  def index
    # @posts = Post.all
    #  go to the welcome#index view and show ALL posts from everyone
    # What would happen if your app had 1,000,000 posts? .limit?
    @posts = Post.all
  end
end
