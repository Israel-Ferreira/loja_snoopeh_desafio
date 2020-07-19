# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json


  def destroy 
    if resource.current_cart
      resoruce.current_cart.update(active: false)
    end

    super
  end


  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
