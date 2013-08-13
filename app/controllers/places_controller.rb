class PlacesController < ApplicationController
  
  def new
    @place = Place.new
  end
  
  def create
    @place = Place.new(params[:place])
    if @place.save
      flash[:success] = 'Place Added!'
      redirect_to places_path
    end
  end

  def index
    @place = Place.all
  end

  def destroy
    Place.find(params[:id]).destroy
    redirect_to places_path
  end
  
  def manage
    @place = Place.all
  end
  
  def show
    @event = Event.find(params[:event_id])
    @place = @event.places.find(params[:id])
    @order = Order.new(params[:order])
  end
  
end
