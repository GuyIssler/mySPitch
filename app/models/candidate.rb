class Candidate < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :cv, :phone_number
end
