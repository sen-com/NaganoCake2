class Admin::OrdersController < ApplicationController
  
  before_action :authenticate_admin!

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @end_user = EndUser.find(@order.end_user_id)
  end
  
  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if params[:order][:order_status] == "confirmed_payment"
        @order.order_details.each do |order_detail|
          order_detail.production_status = "awaiting_production"
          order_detail.save
        end
      end
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:end_user_id, :name, :post_number, :address, :postage, :method_payment, :totsl_payment, :order_status)
    end
end
