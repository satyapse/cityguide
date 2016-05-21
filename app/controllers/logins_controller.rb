class LoginsController < ApplicationController

 def new
 end
 
 def create
  customer = Customer.find_by(email: params[:email])
  if customer && customer.authenticate(params[:password])
   	session[:customer_id] = customer.id
   	flash[:success] = "You are logged in"
   	redirect_to ptemples_path
  else
   	flash.now[:danger] = "Your email address or password doesnot match"
   	render 'new'
  end
 end
 
 def destroy
  session[:customer_id] = nil
  flash[:success] = "You have logged out"
  redirect_to root_path
 end

 
end