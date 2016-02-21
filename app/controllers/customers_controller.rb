class CustomersController < ApplicationController
	before_action :find_customer, only: [:show, :edit, :update, :destroy]

  def index
  	@customers = Customer.all.order("companyName DESC")
  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.new(customer_params)
  	if @customer.save
      flash[:notice]="Customer Added"
  		redirect_to @customer
  	else
  		render 'new'
  	end
  end

  def show

  end

  def edit
  
  end

  def update
  	
  	if @customer.update(customer_params)
      flash[:notice]="Customer Updated"
  		redirect_to @customer
  	else
  		render 'edit'
  	end
  end

 	def destroy
 		@customer.destroy
 		redirect_to root_path
 	end

private

	def find_customer
		@customer = Customer.find(params[:id])
	end

	def customer_params
		params.require(:customer).permit(:companyName, :email, :fname, :lname)
	end

end
