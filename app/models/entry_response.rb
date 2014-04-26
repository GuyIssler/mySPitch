class EntryResponse < ActiveRecord::Base
  belongs_to :entry
  belongs_to :response

  # attr_accessible :title, :body
end
