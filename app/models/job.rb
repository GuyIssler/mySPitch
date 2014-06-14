class Job < ActiveRecord::Base
  belongs_to :employer, foreign_key: "recruiter_id"
  has_many :entries, :dependent => :destroy
  has_many :questions, :dependent => :destroy
  has_many :video_questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :video_questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  attr_accessible :title, :description, :email_content, :questions_attributes, :video_questions_attributes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  validates :title, :email_content, presence: :true

  # paperclips
  has_attached_file :logo, :storage => :s3, :path => "/:class/:id/logo/:filename", :s3_credentials => "#{Rails.root}/config/s3.yml", :styles => { :small => "150x150>", :medium => "250x250>" }
  validates_attachment_size :logo, :less_than => 1.megabyte

  after_create :create_hash
  
  def create_hash
    if self.job_hash.nil?
      salt = "asdjh208708asdfd0u098"
      self.job_hash = Digest::MD5.hexdigest(self.id.to_s + salt)
      self.save
    end
  end
end
