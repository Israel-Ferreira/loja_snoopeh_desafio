# frozen_string_literal: true

class SnoopehStore::ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  def index
    @products = Product.all
    render json: @products
  end

  def create
    if Product.create!(product_params)
      render json: { message: 'Produto criado com sucesso' }, status: :created
    else
      render json: { message: 'Erro ao tentar criar o produto' }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @product
  end

  def destroy
    render json: { message: 'Produto Excluido com Sucesso' } if @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :price, :thumbnail_hd, :category_id, :cep)
  end
end
