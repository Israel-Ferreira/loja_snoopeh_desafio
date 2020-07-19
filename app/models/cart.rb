# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  def total_to_pay
    cart_items.sum(&:total_price)
  end
end
