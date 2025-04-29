class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  def render_not_found(error)
    render json: ErrorSerializer.format_error(ErrorMessage.new(error.message, 422)), status: :not_found
  end
end