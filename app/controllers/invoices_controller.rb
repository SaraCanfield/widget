class InvoicesController < ApplicationController
    
  def index
  		@customer = Customer.find(params[:customer_id])
  		@invoices = Invoice.all
  end

  def new
  	@customer = Customer.find(params[:customer_id])
  	@invoice = Invoice.new
  end

  def create   
  	@customer = Customer.find(params[:customer_id])
  	
    @invoice = @customer.invoices.new(params[:invoice].permit(:quantity, :color, :widgetType, :orderDate, :requiredDate))
    if @invoice.save
        flash[:notice]="Invoice Added"
  	     redirect_to @customer
    else 
      render "new"
    end
  end


  
  def edit
    @customer = Customer.find(params[:customer_id])
    @invoice = @customer.invoices.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @invoice = @customer.invoices.find(params[:id])
    if @invoice.update(params[:invoice].permit(:quantity, :color, :widgetType, :orderDate, :requiredDate))
      flash[:notice]="Invoice Updated" 
      redirect_to @customer
    else
      render "edit"
    end    
  end
  
  def destroy
    @customer = Customer.find(params[:customer_id])
    @invoice = @customer.invoices.find(params[:id])
    @invoice.destroy
    flash[:notice]="Invoice Deleted" 
    redirect_to :back
  end

  private

  def invoice_params
  	params.require(:invoice).permit(:quantity, :color, :widgetType, :orderDate, :requiredDate)
  end

end
