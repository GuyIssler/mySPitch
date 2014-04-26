class AddInviteFieldsToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :name, :string
    add_column :entries, :email, :string
  end
end
