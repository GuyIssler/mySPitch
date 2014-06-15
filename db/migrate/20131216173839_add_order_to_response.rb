class AddOrderToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :response_order, :integer
  end
end
