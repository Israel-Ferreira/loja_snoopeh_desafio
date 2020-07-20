class TxnSerializer < ActiveModel::Serializer
  attributes :id, :user, :cart
  has_one :credit_card
end
