class Api::ApiController < ActionController::API
  before_action :validate_app_token
  before_action :set_headers

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
