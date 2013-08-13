class Event < ActiveRecord::Base
  attr_accessible :name, :start_time, :places_attributes, :price, :poster, :duration, :content
  
  has_many :places, :dependent => :destroy
  
  accepts_nested_attributes_for :places
  
  has_attached_file :poster, styles: {:medium => "250x400>",
                                      :thumb => "500x500!"

  }


 end
