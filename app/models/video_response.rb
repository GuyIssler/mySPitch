class VideoResponse < ActiveRecord::Base

  belongs_to :video_question

  #has_many :entries
  has_many :entry_video_responses
  has_many :entries, :through => :entry_video_responses, :source => :entry, :dependent => :destroy


  attr_accessible :content, :is_true, :question_id
end
