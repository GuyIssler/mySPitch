class Entry < ActiveRecord::Base
  belongs_to :job

  #has_many :responses
  has_many :entry_responses
  has_many :responses, :through => :entry_responses, :source => :response , :dependent => :destroy

  has_many :entry_video_responses
  has_many :video_responses, :through => :entry_video_responses, :source => :video_response , :dependent => :destroy

  attr_accessible :name, :email, :is_user_response

  devise :timeoutable

  # validations
  validates :name, :email, presence: :true

  # paperclips
  has_attached_file :temp_video, :storage => :s3, :use_timestamp => false, :path => "/:class/:id/temp_video/:filename", :s3_credentials => "#{Rails.root}/config/s3.yml"
  #validates_attachment_size :temp_video, :less_than => 10.megabyte

  has_attached_file :temp_audio, :storage => :s3, :use_timestamp => false, :path => "/:class/:id/temp_audio/:filename", :s3_credentials => "#{Rails.root}/config/s3.yml"
  #validates_attachment_size :temp_audio, :less_than => 10.megabyte

  has_attached_file :video,  :storage => :s3, :use_timestamp => false, :path => "/:class/:id/video/:filename", :s3_credentials => "#{Rails.root}/config/s3.yml"
  #validates_attachment_size :video, :less_than => 10.megabyte

  # state machine
  state_machine :state, :initial => :draft do
    event :invite do
      transition [:draft] => :invited
    end

    event :process do
      transition [:invited] => :processing
    end

    event :apply do
      transition [:processing] => :applied
    end

    event :review do
      transition [:applied] => :reviewed
    end

    after_transition :to => :invited, :do => :send_invitation
    after_transition :to => :processing, :do => :process_files
    after_transition :to => :applied, :do => :notify_employer
  end

  after_create :create_hash

  def ready_to_process?
    temp_video.exists? and temp_audio.exists?
  end

  def send_invitation
    EntryMailer.invite_email(self).deliver
  end

  def process_files
    EntryVideoWorker.perform_async(self.id)
  end

  def notify_employer
    EntryMailer.employer_notification_email(self).deliver
  end
  
  def create_hash
    if self.entry_hash.nil?
      salt = "asdjh208708asdfd0u098"
      self.entry_hash = Digest::MD5.hexdigest(self.id.to_s + salt)
      self.save
    end
  end
end
