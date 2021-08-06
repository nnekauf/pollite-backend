Rails.application.routes.draw do
  post "/api/v1/find_reps", to: "api/v1/representatives#show"

  get '/api/v1/representatives/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
