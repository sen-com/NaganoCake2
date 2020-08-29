class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_present_item = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_present_item.amount = @cart_present_item.amount + @cart_item.amount
      @cart_present_item.save(cart_item_params)
      redirect_to cart_items_path
    else
      @cart_item.end_user_id = current_end_user.id
      @cart_item.save(cart_item_params)
      redirect_to cart_items_path
    end
  end

  def update
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render :index
    end

  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    cart_items = CartItem.where(end_user_id: current_end_user.id)
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount,:item_id)
  end

end
