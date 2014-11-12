class CandidateFeedbacksController < ApplicationController

  def create
    @candidate = Candidate.find_by_id(params[:candidate_feedback][:user_id])
    CandidateFeedback.create(:user_id => current_employer.id,
                             :candidate_id => @candidate.id,
                             :rating => params[:candidate_feedback][:rating],
                             :weaknesses => params[:candidate_feedback][:weaknesses],
                             :strengths => params[:candidate_feedback][:strengths],
                             :feedback =>  params[:candidate_feedback][:feedback])

  end

  def show
    @feedbacks = CandidateFeedback.where(:candidate_id => params[:id])
    @candidate = Candidate.find_by_id(params[:id])
    @avrg = CandidateFeedback.calc_average_rating(params[:id],@feedbacks)

  end
end