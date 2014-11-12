class CandidateFeedback < ActiveRecord::Base
  attr_accessible :user_id, :candidate_id, :rating, :strengths, :weaknesses,:feedback

  def self.calc_average_rating(candidate_id,feedbacks)

    total_rating = 0
    total_feedbacks = 1
    feedbacks.each_with_index do |feedback,index|
      total_rating += feedback.rating
      total_feedbacks = index
    end
    total_rating.to_f / (total_feedbacks+1).to_f
  end
end
