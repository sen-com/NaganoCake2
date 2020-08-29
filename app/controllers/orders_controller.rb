class OrdersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :set_cart_item, except: [:index, :show] 
  before_action :exist_order, only: [:index, :show]

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_end_user.orders
  end

  def check
    @order = Order.new
    @cart_items = current_end_user.cart_items.where(end_user_id: current_end_user.id)
    if  params[:order][:address_option] == "0"
      @order.name = current_end_user.first_name + current_end_user.last_name
      @order.post_number = current_end_user.postal_code
      @order.address = current_end_user.address
      @order.method_payment = params[:order][:method_payment]
    elsif params[:order][:address_option] == "1"
      @address = current_end_user.addresses.find_by(id: params[:order][:address_id])
      @order.name = @address.name
      @order.post_number = @address.postal_number
      @order.address = @address.address
      @order.method_payment = params[:order][:method_payment]
    elsif params[:order][:address_option] == "2"
      @order.name = params[:order][:name]
      @order.address = params[:order][:address]
      @order.post_number = params[:order][:post_number]
      @order.method_payment = params[:order][:method_payment]
    end
    render :new if @order.invalid?
  end

  def end
    current_end_user.cart_items.destroy_all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.end_user_id = current_end_user.id
    @addresses = Address.where(end_user_id: current_end_user.id)
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    @addresses = Address.where(end_user_id: current_end_user.id)  
    if @order.save(order_params)
      current_end_user.cart_items.each do |cart_item|  
        order_detail = OrderDetail.new
        order_detail.order_id = @order.id
        order_detail.item_id = cart_item.item_id
        order_detail.quantitty = cart_item.amount
        order_detail.tax_included_price = (cart_item.item.price_excluding_tax * 1.1)
        if order_detail.save
        else
          render :new
        end
      end
      redirect_to orders_end_path
    else
      render :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:end_user_id, :name, :post_number, :address, :totsl_payment, :postage, :method_payment)
    end
    # def order_detail_params
    #   params.require(:order_detail).permit(:order_id, :item_id)
    # end
    def set_cart_item
      if current_end_user.cart_items.empty?
        redirect_to end_users_path
      else
      end
    end
    def exist_order
      if current_end_user.orders.empty?
        redirect_to end_users_path
      else
      end
    end

end
