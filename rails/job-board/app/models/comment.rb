class Comment < ActiveRecord::Base
  belongs_to :job, counter_cache: true
  attr_accessible :body, :job_id, :name
  validates_presence_of :body, :job_id, :name
end
