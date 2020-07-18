# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
  end

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      error_json = { status: '400', title: 'Bad Request', detail: resource.errors }
      render json: { errors: error_json }, status: :bad_request
    end
  end
end
