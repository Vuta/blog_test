class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(50)
  end
end