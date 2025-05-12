class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from ActionController::ParameterMissing, with: :missing_parameter


  private

  def not_found(error)
    render json: ErrorSerializer.format_error(ErrorMessage.new(error.message, 404)), status: :not_found
  end

  def unprocessable_entity(error)
    render json: ErrorSerializer.format_error(ErrorMessage.new(error.message, 422)), status: :unprocessable_entity
  end

  def missing_parameter(errpr)
    render json: ErrorSerializer.format_error(ErrorMessage.new(error.message, 400)), status: :bad_request
  end
end
