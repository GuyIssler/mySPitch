class AddIsUserResponseToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :is_user_response, :boolean
  end
end
