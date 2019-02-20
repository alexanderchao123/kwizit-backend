Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/authenticate_user', to: "authentication#create"
      get '/authenticate_token', to: "authentication#show"
      get '/authenticate_round/:pin', to: "rounds#show"
      resources :users
      resources :guests
      resources :quizzes do
        resources :rounds, except: [:show] do
          resources :round_questions, only: [:index, :create, :show]
          resources :decisions
        end
      end
    end
  end

  mount ActionCable.server => '/cable'
end
