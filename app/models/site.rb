class Site < ActiveRecord::Base
#  has_many :connections
 # accepts_nested_attributes_for :connections
  validates_presence_of :name, :username, :sitename
end
