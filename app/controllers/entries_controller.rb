class EntriesController < ApplicationController
  before_filter :authenticate_employer!, :except => [:apply, :save, :confirm,:exist]
  before_filter :set_job, :except => [:apply,:record, :save, :confirm,:exist]
  before_filter :check_for_valid_browser, :only => [:apply]

  def index
    @entries = @job.entries.all
  end

  def new
    @entry = @job.entries.new
  end

  def show
    @entry = @job.entries.find(params[:id])
  end

  def create
    @entry = @job.entries.new(params[:entry])
    if @entry.save
      @entry.invite
      redirect_to job_entries_path(@job), notice: "Candidate invitation sent successfully."
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    @entry = @job.entries.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to job_entries_path(@job), notice: "Entry deleted." }
      format.json { head :no_content }
    end
  end

  # entry application related

  def apply
    @entry = Entry.find_by_entry_hash(params[:entry_hash])
    @job = @entry.job
    render layout: "apply"
  end

  def record
    @entry = Entry.find_by_entry_hash(params[:entry_hash])
    @job = @entry.job
    @job.questions.each do |q|
        if (q.responses.count > 1)
          if (@entry.responses.where(:question_id => q.id).empty?)
            user_response = q.responses.find(params["content_#{q.id}"]).dup
            user_response.is_user_response = true
            @entry.responses << user_response
          end
        else
          if (@entry.responses.where(:question_id => q.id).empty?)
            @entry.responses.new(:content => params["content_#{q.id}"], :question_id => q.id, :is_user_response => true)
          end
        end
    end
    @video_question_index = 0
    @entry.save
    render layout: "apply"
  end

  def exist
    entries = Entry.where(:email => params[:email])
    entry_ids = entries.map {|e| e.id}
    entry_video_paths = entries.map {|e| e.video_file_name}
    render :json => {:entry_ids => entry_ids, :entry_video_paths => entry_video_paths}
  end

  def confirm
    @entry = Entry.find_by_entry_hash(params[:entry_hash])
    @job = @entry.job
    render layout: "apply"
  end

  def save
    @entry = Entry.find_by_entry_hash(params[:entry_hash])
    
    @entry.temp_video = params["video-blob"] if params["video-blob"]
    @entry.temp_audio = params["audio-blob"] if params["audio-blob"]
    @entry.save   # some times failing due to timeout : AWS::S3::Errors::RequestTimeout
                  # (Your socket connection to the server was not read from or written to within the timeout period.
                  # Idle connections will be closed.):
                  # app/controllers/entries_controller.rb:65:in `save'
    if @entry.ready_to_process?
      @entry.process
      render text: "finished"
    else
      render text: "Unable to process the recorded video"
    end
       
    
  end

  private 
    def set_job
      if params[:job_hash]
        @job = Job.find_by_job_hash(params[:job_hash])
      else
        @job = current_employer.jobs.find(params[:job_id])
      end
    end
end
