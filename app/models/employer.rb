class Employer < ActiveRecord::Base

  has_many :jobs, foreign_key: "recruiter_id"


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable#, :confirmable, :lockable, :timeoutable#, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  # attr_accessible :title, :body
  validates :first_name, :last_name, presence: true

  def profile_pic_url
    
  end

  def fullname
    "#{first_name} #{last_name}"
  end
end
