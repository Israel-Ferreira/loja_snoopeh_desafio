class CreditCard < ApplicationRecord
  belongs_to :txn 
  validates :card_holder_name, :card_number, :cvv, presence: true 
end
