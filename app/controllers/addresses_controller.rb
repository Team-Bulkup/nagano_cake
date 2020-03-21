class AddressesController < ApplicationController
  def index
    @customer = Customer.find(current_customer.id)
    @address = Address.new

  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "配送先を登録しました"
      redirect_to addresses_path
    else
      render :index
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  protected
  def address_params
    params.require(:address).permit(:postcode, :address, :name, :phone_number)
  end
end
