class CustomersController < ApplicationController
  def index
    @customers=Customer.all
  end

  def new
    @customer= Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        if session[:state] == 'admin'
          format.html { redirect_to '/options', notice: 'Customer was successfully created' }
          format.json { render json: @customer, status: :created, location: @customer }
        else
          format.html { redirect_to :controller => 'welcome', :action => 'index', notice: 'Customer was successfully created.' }
          format.json { render json: @customer, status: :created, location: @customer }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @customer = Customer.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(customer_params)
        format.html { redirect_to @customers, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    if @customer.destroy

      flash[:notice] = "Successfully deleted customer!"
      if session[:state] == 'admin'
        redirect_to '/options'
      else
        redirect_to :controller => 'sessions', :action => 'destroy'
      end
    else
      flash[:alert] = "Error deleting customer!"
    end
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :password)
  end
end
