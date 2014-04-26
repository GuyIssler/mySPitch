class CreateEntryVideoResponses < ActiveRecord::Migration
  def change
    create_table :entry_video_responses do |t|
      t.integer :video_response_id
      t.integer :entry_id
      t.timestamps
    end
  end
end
