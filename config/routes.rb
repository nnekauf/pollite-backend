Rails.application.routes.draw do
  # post "/api/v1/find_reps", to: "api/v1/representatives#show"

  # get '/api/v1/representatives/show'
  namespace :api do
    namespace :v1 do
      resources :representatives, only: [:index] 
    end
  end
end
