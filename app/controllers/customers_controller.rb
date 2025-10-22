class CustomersController < ApplicationController
   def new 
    @customer = Customer.new
  end
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to new_customer_path, notice: "Customer registered successfully!"
    else
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:customer_name, :customer_email, :customer_feedback, :password, :password_confirmation)
  end
end
