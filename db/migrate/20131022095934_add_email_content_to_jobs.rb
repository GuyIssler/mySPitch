class AddEmailContentToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :email_content, :text
  end
end
