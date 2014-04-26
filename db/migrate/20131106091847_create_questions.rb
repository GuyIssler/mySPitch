class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text "content"
      t.boolean "is_open_question"
      t.timestamps
    end
  end
end
