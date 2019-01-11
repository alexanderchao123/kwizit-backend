Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/authenticate', to: "auth#create"
      get '/current_user', to: "auth#show"
      resources :users
      resources :quizzes
    end
  end

  mount ActionCable.server => '/cable'
end
