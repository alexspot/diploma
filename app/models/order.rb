class Order < ActiveRecord::Base
  
  attr_accessible :place_number, :price, :place_id, :user_id, :date
  
  belongs_to :user
  belongs_to :place
  
  accepts_nested_attributes_for :user, :place
  
  after_save :set_place_status
  
  #validates :user_id, presence: true
  
  private
  
end
