class AddPaperclipsToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :video_file_name, :string
    add_column :entries, :video_content_type, :string
    add_column :entries, :video_file_size, :integer
    add_column :entries, :video_updated_at, :datetime
    
    add_column :entries, :temp_video_file_name, :string
    add_column :entries, :temp_video_content_type, :string
    add_column :entries, :temp_video_file_size, :integer
    add_column :entries, :temp_video_updated_at, :datetime

    add_column :entries, :temp_audio_file_name, :string
    add_column :entries, :temp_audio_content_type, :string
    add_column :entries, :temp_audio_file_size, :integer
    add_column :entries, :temp_audio_updated_at, :datetime

  end
end
