class CreateVideoQuestions < ActiveRecord::Migration
  def change
    create_table :video_questions do |t|
      t.integer   "job_id"
      t.integer   "max_duration"
      t.integer   "max_takes"
      t.text "content"
      t.timestamps
    end
  end
end
