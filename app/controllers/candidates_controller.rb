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
  end

  def rate
    @candidate = Candidate.find_by_id(params[:id])
  end
end
