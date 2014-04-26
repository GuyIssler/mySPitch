class CreateVideoResponses < ActiveRecord::Migration
  def change
    create_table :video_responses do |t|
      t.integer   "video_question_id"
      t.integer   "duration"
      t.integer   "take_num"
      t.string    "video_url"
      t.timestamps
    end
  end
end
