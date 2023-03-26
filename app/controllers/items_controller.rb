class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
  else
    items = Item.all
  end
    render json: items, include: :user
  end
  
  def show
    item = Item.find(params[:id])
    render json: item, include: :user
  end

  def create
    item = Item.create!(items_params)
    render json: item, include: :user, status: 201
  end

  private

  def items_params
    params.permit(:name, :description, :price, :user_id)
  end

end
