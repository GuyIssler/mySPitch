class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string  "state"
      t.string  "title"
      t.text    "description"
      t.string  "recruiter_id"
      t.string  "job_hash"
      t.timestamps
    end
  end
end
