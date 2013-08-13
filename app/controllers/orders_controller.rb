class OrdersController < ApplicationController
  
  
  def new
    @place = Place.find(params[:place_id])
    @event = Event.find(@place.event_id)
    @order = Order.new
  end
  
  def create
    @user  = current_user
    @place = Place.find(params[:place_id])
    @order = @place.create_order(params[:order]) 
    if @order.save
      @place.update_attributes(params[:status])
      flash[:success] = "You h1ave ordered a ticket"
      redirect_to root_path
    end
  end

  def destroy
    Order.find(params[:id]).destroy
    flash[:notice] = "Order has been cancelled"
    redirect_to root_path
  end

  def show
  end

  
  
end
