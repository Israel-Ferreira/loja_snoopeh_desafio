class CartSerializer < ActiveModel::Serializer
  attributes :id, :active
  has_many :cart_items
end