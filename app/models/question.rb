class Question < ActiveRecord::Base
  belongs_to :job
  has_many :responses
  accepts_nested_attributes_for :responses , :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  attr_accessible :content, :is_open_question, :job_id   , :responses_attributes

  #validates_presence_of :is_open_question
  validate :responses_num
  validate :has_one_correct_response

  private
  def responses_num
    total_responses =  self.responses.size

    responses.each do |r|
      if r._destroy
        total_responses -= 1
      end
    end


    if total_responses == 1
        errors.add(:responses, "Number of optional responses cant be equal to 1")
    end
  end

  def has_one_correct_response
    num_of_correct_responses = 0
    responses.each do |r|
      if r.is_true
        num_of_correct_responses += 1
      end
    end

    if num_of_correct_responses != 1 && !responses.empty?
      errors.add(:responses, "Number of correct responses must be equal to 1")
    end
  end

end
