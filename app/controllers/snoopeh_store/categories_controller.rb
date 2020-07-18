# frozen_string_literal: true

class SnoopehStore::CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy] 

  def index
    @categories = Category.all
    render json: @categories
  end

  def create 
    @category =  Category.new(category_params)
    if @category.save 
      render json: @category, status: :created 
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @category
  end

  def update
    if @category.update(category_params)
      render json: @category
    else
      error_msg = @category.errors.full_messages.to_sentence
      render json: { message: error_msg }, status: :unprocessable_entity
    end
  end

  def destroy 
    if @category.destroy
      head :ok
    else
      error_msg = @category.errors.full_messages.to_sentence
      render json: { message: error_msg }, status: :unprocessable_entity
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
