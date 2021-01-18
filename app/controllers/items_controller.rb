# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :load_item, only: %i[show update destroy]

  def index
    items = Item.all.page(params[:page])

    render json: items
  end

  def show
    render json: item
  end

  def create
    item = Item.new(owner: current_user, **item_params)
    if item.save
      render json: item
    else
      render json: { errors: item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if item.update(item_params)
      render json: item
    else
      render json: { errors: item.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    item.destroy
  end

  private

  attr_reader :item

  def item_params
    params.require(:item).permit(:name, :price)
  end

  def load_item
    (@item = Item.find_by(id: params[:id])) || head(:not_found)
  end

  def current_user
    @current_user ||= User.first
  end
end
