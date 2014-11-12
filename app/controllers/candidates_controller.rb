class CandidatesController < ApplicationController


  def new
    @candidate = Candidate.new
  end

  def create
    Candidate.create(:first_name => params[:candidate][:first_name],
                     :last_name => params[:candidate][:last_name],
                     :email => params[:candidate][:email],
                     :phone_number => params[:candidate][:phone_number],
                     :cv =>  params[:candidate][:cv])
  end

  def show

  end

  def survey
    @candidate = Candidate.find_by_id(params[:id])
    @candidate_feedback =CandidateFeedback.new
  end

  def rate
    CandidateFeedback.create(:user_id => current_employer.id,
                     :candidate_id => params[:candidate_id],
                     :rating => params[:rating],
                     :weaknesses => params[:weaknesses],
                     :strengths => params[:strengths],
                     :feedback =>  params[:feedback])
    @candidate = Candidate.find_by_id(params[:id])
  end

  def feedback
    x = params
  end
end
