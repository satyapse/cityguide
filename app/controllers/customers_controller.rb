class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update] 
   
  def index
   @customers = Customer.paginate( page: params[:page], per_page: 1)
  end

  def new
   @customer = Customer.new 
  end
  
  def create
	@customer = Customer.new(customer_params)
   if @customer.save
	flash[:success] = "Your account has been created succesfully"
 	session[:customer_id] = @customer.id
	redirect_to ptemples_path
   else
	render'new'
   end
  end
  
  def edit
# 	@customer = Customer.find(params[:id])
  end

  def update
# 	@customer = Customer.find(params[:id])
	if @customer.update(customer_params)
		flash[:success] = "Your profile has been updated succesfully"
		redirect_to customer_path(@customer)
	else
		render'edit'
	end
  end

  def show
#   @customer = Customer.find(params[:id])
   @ptemples = @customer.ptemples.paginate( page: params[:page], per_page: 3)
  end
private
  def customer_params
	params.require(:customer).permit(:customername, :email, :password)
  end
  
  def set_customer
    @customer = Customer.find(params[:id])
  end 
  
  def require_same_user
	if current_user != @customer
		flash[:danger] = "You can only edit your own profile"
		redirect_to root_path
	end
  end
   
   
    
end