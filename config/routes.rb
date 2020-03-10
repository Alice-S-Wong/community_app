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
    post "/answers" => "answers#create"
    get "/answers/:id" => "answers#show"
    patch "/answers/:id" => "answers#update"
    get "/question_bookmarks" => "question_bookmarks#index"
    post "/question_bookmarks" => "question_bookmarks#create"
    delete "/question_bookmarks/:id" => "question_bookmarks#destroy"
    get "/answer_bookmarks" => "answer_bookmarks#index"
    post "/answer_bookmarks" => "answer_bookmarks#create"
    delete "/answer_bookmarks/:id" => "answer_bookmarks#destroy"
  end
end
