class ItemsController < ApplicationController

  def top
    @items = Item.where(is_working: "true")
  end

  def index
    @ranking_items = Item.where(id: OrderDetail.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
    @items = Item.where(is_working: "true").search(params[:search])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
