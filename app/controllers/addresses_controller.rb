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
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
    if @address.customer_id != current_customer.id
      redirect_to customers_path(current_customer)
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice]="登録先を編集しました"
      redirect_to addresses_path
    else
      render :edit
    end
  end

  protected
  def address_params
    params.require(:address).permit(:postcode, :address, :name, :phone_number)
  end
end
