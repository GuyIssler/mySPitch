class AddLogoToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :logo_file_name, :string
    add_column :jobs, :logo_content_type, :string
    add_column :jobs, :logo_file_size, :integer
    add_column :jobs, :logo_updated_at, :datetime
  end
end
