Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
    get "/questions" => "questions#index"
    post "/questions" => "questions#create"
    get "/questions/:id" => "questions#show"
    patch "/questions/:id" => "questions#update"
    get "/answers/:id" => "answers#show"
  end
end
