class PtemplesController < ApplicationController
 before_action :set_ptemple, only: [:edit, :update, :show, :like]
 before_action :require_user, except: [:show, :index]
 before_action :require_same_user, only: [:edit, :update]
 
 def index
   @ptemples = Ptemple.paginate( page: params[:page], per_page: 3)
 end

 def show
   # @ptemple = Ptemple.find(params[:id])
 end

 def new
  @ptemple = Ptemple.new
 end

 def create
  @ptemple = Ptemple.new(ptemple_params)
  @ptemple.customer = current_user

  if @ptemple.save
    flash[:success] = "Temple was created successfully!"
    redirect_to ptemples_path
  else
  	render :new
  end
 end
 
 def edit
   # @ptemple = Ptemple.find(params[:id])
 end

 def update
  # @ptemple = Ptemple.find(params[:id])
   if @ptemple.update(ptemple_params)
    flash[:success] = "Temple was updated successfully!"
    redirect_to ptemple_path(@ptemple)
   else
 	render :edit
   end
 end
 
 def like
  # @ptemple = Ptemple.find(params[:id])
  like = Like.create(like: params[:like], customer: current_user, ptemple: @ptemple)
  if like.valid?
   flash[:success] = "Your selection was successful"
   redirect_to :back
  else
	  flash[:danger] = "You can only like/dislike once"
	  redirect_to :back
  end
 end

 private
   def ptemple_params
    params.require(:ptemple).permit(:name, :summary, :description, :picture)
   end
   
   def set_ptemple
    @ptemple = Ptemple.find(params[:id])
   end

   def require_same_user
     if current_user != @ptemple.customer 
     flash[:danger] = "You can only edit your own profile"
     redirect_to ptemples_path
     end
   end

end