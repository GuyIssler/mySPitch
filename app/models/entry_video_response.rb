class EntryVideoResponse < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :entry
  belongs_to :video_response

end
