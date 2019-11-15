class CustomersController < ApplicationController
  def index
    @customers = Customer.where(blacklist: false)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    if params[:customer].present?
      @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
        redirect_to @customer
      else
        render action: 'edit'
      end
    end

    if params[:phone].present?
      customer = Customer.where(phone: params[:phone])
      customer.map do |j|
        j.blacklist = true
        j.save
      end
      redirect_to customers_index_url
    end

    if params[:ids].present?
      params[:ids].each do |i|
        customer = Customer.find(i)
        if customer.blacklist == false
          customer.blacklist = true
        else
          customer.blacklist = false
        end
        customer.save
      end
      redirect_to customers_index_url
    end
  end

  def blacklist
    @blacklist = Customer.where(blacklist: true)
  end

  private

    def customer_params
        params.require(:customer).permit(:name, :phone, :description, :blacklist)
    end
end
