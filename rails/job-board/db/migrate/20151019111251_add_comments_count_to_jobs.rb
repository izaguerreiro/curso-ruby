class AddCommentsCountToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :comments_count, :integer, default: 0
  end
end
