# frozen_string_literal: true

class SnoopehStore::CartsController < ApplicationController
  before_action :set_cart, only: [:show]
  
  def index
    @carts = current_user.carts
    render json: @carts
  end

  def show
    render json: @cart
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end
end
