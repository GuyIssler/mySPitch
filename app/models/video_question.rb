class VideoQuestion < ActiveRecord::Base
  belongs_to :job
  has_many :video_responses
  accepts_nested_attributes_for :video_responses, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  attr_accessible :content, :job_id, :max_duration, :max_takes, :video_responses_attributes

end
