class Site < ActiveRecord::Base
  has_many :connections
  accepts_nested_attributes_for :connections
  validates_presence_of :name, :src_sitename, :src_username, :dest_sitename, :dest_username 
end
