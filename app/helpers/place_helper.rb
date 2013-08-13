module PlaceHelper
  
  def current_place
    @place ||= Place.find_by_id(params[:id])
  end
  
  
end
