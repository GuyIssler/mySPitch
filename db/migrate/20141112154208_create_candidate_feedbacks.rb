class CreateCandidateFeedbacks < ActiveRecord::Migration
  def change
    create_table :candidate_feedbacks do |t|
      t.integer :user_id
      t.integer :candidate_id
      t.integer :rating
      t.string :weaknesses
      t.string :strengths
      t.string :feedback
      t.timestamps
    end
  end
end
