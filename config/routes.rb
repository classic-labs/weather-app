Rails.application.routes.draw do
  devise_for :users
  
  # app root
  root to: "dashboard#index"
  
  # weather
  post "weather/current-weather", to: "weather#current_weather", as: :current_weather
  
  # app wide errors
  get "errors/404", to: "errors#record_not_found"
end
