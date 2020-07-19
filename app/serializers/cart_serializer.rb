class CartSerializer < ActiveModel::Serializer
  attributes :id, :active, :total_value
  has_many :cart_items

  def total_value 
    object.total_to_pay
  end
end
