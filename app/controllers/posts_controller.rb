class PostsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(50)
  end

  def new
    @post = current_user.posts.build
  end

  def show
    @post = Post.find_by(id: params[:id])

    unless @post
      flash[:notice] = "The page you was looking for doesn't exist!"
      redirect_to root_path
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "New post created."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
