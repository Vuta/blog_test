class Api::SearchController < Api::ApiController
  def index
    posts = Post.search(params[:title], params[:user_id]).page(params[:page]).per(params[:per_page])
    render json: posts, status: :ok
  end
end
