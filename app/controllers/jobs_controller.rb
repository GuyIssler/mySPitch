class JobsController < ApplicationController
  before_filter :authenticate_employer!

  def index
    @jobs = current_employer.jobs.all
  end

  def new
    @job = current_employer.jobs.new
  end

  def create
    @job = current_employer.jobs.new(params[:job])
    if @job.save
      redirect_to edit_job_path(@job), notice: "Job created successfully."
    else
      render :new
    end
  end

  def show
    @job = current_employer.jobs.find(params[:id])
  end

  def edit
    @job = current_employer.jobs.find(params[:id])
  end

  def update
    @job = current_employer.jobs.find(params[:id])
    @job.update_attributes(params[:job])
    if @job.valid?
      redirect_to jobs_path, notice: "Job updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @job = current_employer.jobs.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_path, notice: "Job deleted." }
      format.json { head :no_content }
    end
  end
end
