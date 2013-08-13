class UsersController < ApplicationController

	before_filter :signed_in_user, only: [:edit, :update]
	before_filter :correct_user,   only: [:edit, :update]	
	before_filter :admin_user, only: :destroy

  def new
		@user = User.new
  end
	
	def index
		@user = User.all
	end
	
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash['success'] = 'Profile changed'
			sign_in @user
			redirect_to @user
		else
			render 'edit'
		end
	end
  
  def more_stats
    @date = Date.now
    @user = User.find(params[:id])  
    @order = @user.orders


  end
  
	def show
	  @date = Date.current
		@user = User.find(params[:id])
		@micropost = @user.microposts.all
		@order = @user.orders
		#place_id = @order.place_id
    #@place = Place.find(params[:place_id])
	end

	def create
		@user = User.new(params[:user])
			if @user.save
			  sign_in @user
        redirect_to @user
			  flash[:success] = "Welcome to the sample app!"
			else
				render 'new'	
			end	
	end

	def edit
		@user = User.find(params[:id])
	end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_path
  end


private



	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless current_user?(@user)
	end
	
	def admin_user
	  redirect_to(root_path) unless current_user.admin?
	end


end
