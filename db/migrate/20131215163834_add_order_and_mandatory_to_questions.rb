class AddOrderAndMandatoryToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :question_order, :integer
    add_column :questions, :mandatory, :boolean, default: false
  end
end
