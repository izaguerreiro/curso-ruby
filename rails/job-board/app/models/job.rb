class Job < ActiveRecord::Base
  has_many :comments
  scope :most_recent, order("created_at DESC")
  attr_accessible :description, :title, :premium
  validates_presence_of :description, :title
end
