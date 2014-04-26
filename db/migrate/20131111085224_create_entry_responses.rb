class CreateEntryResponses < ActiveRecord::Migration
  def change
    create_table :entry_responses do |t|
      t.integer :response_id
      t.integer :entry_id
      t.timestamps
    end
  end
end
