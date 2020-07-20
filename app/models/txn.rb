# frozen_string_literal: true

class Txn < ApplicationRecord
  belongs_to :user
  belongs_to :cart

  has_one :credit_card
  accepts_nested_attributes_for :credit_card, reject_if: :all_blank, allow_destroy: true
end
