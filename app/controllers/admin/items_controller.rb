class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!, only: [:top, :index]
  def top
    @items = Item.all
  end

  def index
    @items = Item.all.search(params[:search])
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :genre_id, :price_excluding_tax, :is_working)
  end
  
end
