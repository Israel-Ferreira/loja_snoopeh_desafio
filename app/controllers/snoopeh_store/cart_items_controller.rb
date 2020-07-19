# frozen_string_literal: true

class SnoopehStore::CartItemsController < ApplicationController
  def create
    binding.pry
    item  = CartItem.new(cart_item_params)
    @cart.cart_items << item

    if @cart.save!
      render json: @cart, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item = @cart.cart_items.find(params[:id])

    if @cart_item.destroy!
      render json: { message: 'Item Removido com Sucesso do Carrinho' }
    else
      render json: { message: 'Erro ao retirar o item do carrinho' }, status: :unprocessable_entity
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end
