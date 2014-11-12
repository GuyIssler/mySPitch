Myspitch::Application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  devise_for :employers

  devise_for :users

  resources :jobs do
    resources :entries
  end

  resources :candidates

  match "/j/:entry_hash" => "entries#apply", :as => :job_apply_direct
  match "/record/:entry_hash" => "entries#record", :as => :job_apply_record
  match "/confirm/:entry_hash" => "entries#confirm", :as => :job_apply_confirm
  match "/save/:entry_hash" => "entries#save", :as => :entry_video_save

  match "/entries/record" => "entries#record", :as => :job_apply_record
  match "/entries/exist" => "entries#exist", :as => :entry_video_exist

  match "/upgrade_browser" => "pages#upgrade_browser", :as => :upgrade_browser

  match "/candidates/:id/survey" => "candidates#survey", :as => :candidate_survey

  resources :users, only: [:edit, :update]
  resources :employers, only: [:edit, :update]
  root :to => 'pages#index'
end
