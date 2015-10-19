class UpdateCommentsCountInJobs < ActiveRecord::Migration
  def up
  	Job.find_each do |job|
  		Job.reset_counters job.id, :comments 
  	end
  end

  def down
  end
end
