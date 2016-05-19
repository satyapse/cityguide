class PtemplesController < ApplicationController

 def index
   @ptemples = Ptemple.all 
 end

 def show
   @ptemple = Ptemple.find(params[:id])
 end

 def new
  @ptemple = Ptemple.new
 end

 def create
  @ptemple = Ptemple.new(ptemple_params)
  @ptemple.customer = Customer.find(2)

  if @ptemple.save
    flash[:success] = "Temple was created successfully!"
    redirect_to ptemples_path
  else
  	render :new
  end
 end
 
 def edit
   @ptemple = Ptemple.find(params[:id])
 end

 def update
  @ptemple = Ptemple.find(params[:id])
   if @ptemple.update(ptemple_params)
    flash[:success] = "Temple was updated successfully!"
    redirect_to ptemple_path(@ptemple)
   else
 	render :edit
   end
 end

private
   def ptemple_params
    params.require(:ptemple).permit(:name, :summary, :description)
  end

    
end