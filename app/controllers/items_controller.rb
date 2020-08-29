class ItemsController < ApplicationController

  def top
    @items = Item.where(is_working: "true")
  end

  def index
    @items = Item.where(is_working: "true").search(params[:search])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
