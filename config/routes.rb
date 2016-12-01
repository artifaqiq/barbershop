Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :sales, :prices, :services

  root 'home#index'
  mount Attachinary::Engine => "/attachinary"

  if Rails.env.production?
    match '*path' => redirect('/'), via: :get
  end

  scope '/api' do
    post '/show_timetable' => 'time_api#show_timetable'
    post '/create_free_time' => 'time_api#create_free_time'
    post '/create_busy_time' => 'time_api#create_busy_time'
    post 'call_me' => 'call_me#call_me'
  end
end
