# frozen_string_literal: true

class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :product, :price_item

  def price_item
    object.total_price
  end
end
