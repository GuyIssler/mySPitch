class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer   :user_id
      t.integer   :job_id
      t.string    :state
      t.string    :entry_hash
      t.string    :video_url
      t.integer   :rating
      t.timestamps
    end
  end
end
