#require 'recommendation'

class EntryVideoWorker
  include Sidekiq::Worker

  def perform(id)
    entry = Entry.find(id)
    # join the files
    output_file = "#{Rails.root}/tmp/output_#{Time.now.to_i}.webm"
    system("ffmpeg -i #{entry.temp_video} -i #{entry.temp_audio} #{output_file}")
    entry.video = file = File.open(output_file, "r")
    entry.save
    # fwd the state on entry
    entry.apply
    # delete the tmp files
    entry.temp_audio = nil
    entry.temp_video = nil

    # delete the temp output file
    FileUtils.rm(output_file)

    entry.save
  end
end