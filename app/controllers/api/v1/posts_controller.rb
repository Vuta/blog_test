module Api
  module V1
    class PostsController < ApiController
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
    end
  end
end
