class PagesController < ApplicationController
  before_filter :check_for_user, :only => [:index]
  def index
    
  end

  def upgrade_browser
    
  end
end
