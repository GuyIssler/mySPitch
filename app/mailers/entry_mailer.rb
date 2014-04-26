class EntryMailer < ActionMailer::Base
  default from: "notification@videocoverletter.com"

  def invite_email(entry)
    @entry = entry
    @job  = @entry.job
    @url = "#{CVL_ROOT}/j/#{entry.entry_hash}"
    mail(to: @entry.email, subject: 'You have an invitation to apply to a position in Video Cover Letter')
  end

  def employer_notification_email(entry)
    @entry = entry
    @job  = @entry.job
    @employer = @job.employer
    @url = "#{CVL_ROOT}/jobs/#{@job.id}/entries/#{entry.id}"
    mail(to: @employer.email, subject: "#{@entry.name} applied for job #{@job.id} (#{@job.title}")
  end
end
