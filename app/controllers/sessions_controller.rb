class SessionsController < ApplicationController

	def new
	end

	def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:alert] = "Wrong email/password combination. Please check your information."
      render 'new'
    end
 	end

	def destroy
	  sign_out
	  redirect_to root_path
	end

end
