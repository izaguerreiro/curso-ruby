class Job < ActiveRecord::Base
  has_many :comments
  belongs_to :company 
  scope :most_recent, order("created_at DESC")
  attr_accessible :description, :title, :premium
  validates_presence_of :description, :title, :company_id
end
