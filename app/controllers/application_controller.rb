class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :export_i18n_messages

  def export_i18n_messages
    SimplesIdeias::I18n.export! if Rails.env.development?
  end

  private
    def check_for_user
      redirect_to jobs_path if current_employer
    end

    def check_for_valid_browser
      redirect_to upgrade_browser_path unless browser.modern? and (browser.chrome? || browser.firefox?)
    end
end
