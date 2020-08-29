class Admin::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  # PATCH/PUT /order_details/1
  # PATCH/PUT /order_details/1.json
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(@order_detail.order_id)
    if params[:order_detail][:production_status] == "in_production"
      @order.order_status = "in_production"
      @order.save
    end
    if @order_detail.update(order_detail_params)
      count_production_completed = 0
      @order.order_details.each do |order_detail|
        if order_detail.production_status == "production_completed"
          count_production_completed += 1
        end
      end
      if @order.order_details.count == count_production_completed
        @order.order_status = "preparing_for_shipping"
        @order.save
      end
      redirect_to admin_order_path(@order)
    else
      redirect_to admin_order_path(@order)
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def order_detail_params
      params.require(:order_detail).permit(:order_id, :item_id, :tax_included_price, :quantitty, :production_status)
    end
end
