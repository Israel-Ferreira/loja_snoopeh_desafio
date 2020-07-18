class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :thumbnail_hd
  belongs_to :category
end
