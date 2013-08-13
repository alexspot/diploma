class EventsController < ApplicationController
  
  def new
    @event = Event.new
    @event.places.build
  end

  def create
    @event = Event.create(params[:event])
    (1..10).each do |i|
      @event.places.create(:number=>i, :price=> @event.price)
    end
    if @event.save
      flash[:success] = 'Event created'
      redirect_to root_path
    else
      flash[:error] = 'Cannot create Event'
    end
  end

  def edit
    @event = Event.find(params[:id])
    if @event.nil?
      flash[:notice] = 'empty request'
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:success] = 'Event updated'
      redirect_to events_path
    else
      flash[:error] = 'Cant update event'
      render 'edit'
    end


  end

  def show
    @event = Event.find(params[:id])
    @place = @event.places.all
  end

  def index
    @first_event = Event.first
    @event = Event.find(:all, :include => :places, :order => sort_order('created_at'))
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = 'Event deleted'
    redirect_to events_path
  end
  
  def calendar
    @events = Event.all
  end
  
end
