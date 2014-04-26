class ChangeRecruiterIdToInteger < ActiveRecord::Migration
  def up
    remove_column :jobs, :recruiter_id
    add_column :jobs, :recruiter_id, :integer
  end

  def down
  end
end
