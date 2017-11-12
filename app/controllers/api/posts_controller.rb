class Api::PostsController < ApplicationController
  before_action :validate_app_token
  before_action :set_headers

  def index
    posts = Post.page(params[:page]).per(params[:per_page])
    render json: posts, status: :ok
  end

  def show
    post = Post.find_by(id: params[:id])
    if post
      render json: post, status: :ok
    else
      render json: {message: "Post not found"}, status: :notfound
    end
  end

  private

  def validate_app_token
    if request.headers[:app_token] != "temporary token"
      render json: {message: "Unauthorized request"}, status: :unauthorized
    end
  end

  def set_headers
    response.headers["Content-Type"] = "application/json"
  end
end
