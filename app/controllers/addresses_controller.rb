class AddressesController < ApplicationController
  before_action :authenticate_end_user!

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = current_end_user.addresses.all
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
    @address = Address.find(params[:id])
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @addresses = current_end_user.addresses.all
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    if @address.save
      redirect_to addresses_path
    else
      render :index
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
  end

  private
    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:end_user_id, :postal_number, :address, :name)
    end
end
