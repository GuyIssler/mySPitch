class AddVideoInstructionsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :video_instructions, :text
  end
end
