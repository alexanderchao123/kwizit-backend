Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/authenticate', to: "auth#create"
      get '/current_user', to: "auth#show"
      get '/authenticate_round/:pin', to: "rounds#show"
      resources :users
      resources :guests
      resources :quizzes do
        resources :rounds, except: [:show] do
          resources :turns
        end
      end
    end
  end

  mount ActionCable.server => '/cable'
end
