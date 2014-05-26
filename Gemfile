source 'https://rubygems.org'

gem 'rails', '3.2.14'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'compass-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  
  gem "font-awesome-rails"
  gem 'compass-rails'
  gem 'uglifier', '>= 1.0.3'
end

gem 'bootstrap-sass-rails'
gem 'bootstrap-wysihtml5-rails'

gem 'unicorn'
gem 'wicked'
#user management
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'
gem 'uuidtools'
gem 'linkedin'

gem 'browser'

gem 'paperclip', "~> 3.4.0"
gem "aws-sdk", "~> 1.27.0"

gem 'bootstrap_form', '~> 0.3.2'

#background jobs
gem 'sidekiq'
gem 'sinatra', require: false
gem 'slim'

gem 'css3-progress-bar-rails'

gem "state_machine"
gem "i18n-js"

# amazon search
gem 'amazon-ecs'

gem 'rails_admin'

group :development, :test do
  gem 'hirb'
  gem 'thin'
  gem 'sqlite3'
  gem 'rspec-rails', ">= 2.0.0.beta" 
  gem 'httplog', "~> 0.1.0"
  gem "heroku_san", "~> 4.0.4"
  gem 'pry'
  gem 'quiet_assets'
  gem 'sextant'

end

group :production do
  gem 'pg'
end 

gem 'jquery-rails'