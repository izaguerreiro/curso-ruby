class Job < ActiveRecord::Base
  has_many :comments
  attr_accessible :description, :title, :premium
  validates_presence_of :description, :title
end
