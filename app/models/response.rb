class Response < ActiveRecord::Base
  belongs_to :question

  #has_many :entries
  has_many :entry_responses
  has_many :entries, :through => :entry_responses, :source => :entry, :dependent => :destroy

  attr_accessible :content, :is_true, :question_id  ,:is_user_response

  scope :optional_responses, -> { where(:is_user_response => nil) }
  scope :user_responses, -> { where(:is_user_response => true) }

end
