# frozen_string_literal: true

class SnoopehStore::TxnsController < ApplicationController
  def index
    @txns = Txn.includes(:user, :credit_card)
    render json: @txns
  end

  def create
    @txn = Txn.new(txn_params)
    @txn.user = current_user
    @txn.cart = current_user.current_cart

    if @txn.save!
      render json: @txn, status: :created 
    else
      render json: @txn.errors, status: :unprocessable_entity
    end
  end

  private

  def txn_params
    params.require(:txn).permit(:credit_card_id,
      credit_card_attributes: %i[card_holder_name card_number cvv exp_date]
    )
  end
end
