class ItemsController < ApplicationController

  def top
    @items = Item.where(is_working: "true")
  end

  def index
    @ranking_items = Item.find(OrderDetail.group(:item_id).order('sum(quantitty) desc').limit(3).pluck(:item_id))
    # binding.pry
    @items = Item.where(is_working: "true").search(params[:search])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
