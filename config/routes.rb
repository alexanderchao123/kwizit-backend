Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/authenticate_user', to: "authentication#create"
      get '/authenticate_token', to: "authentication#show"
      get '/authenticate_round/:pin', to: "rounds#show"
      get '/rounds/:pin/count', to: "rounds#count"
      resources :users

      resources :quizzes do
        resources :rounds, only: [:index, :create]
      end

      resources :rounds, param: :pin do
        resources :admissions, only: [:index]
        resources :round_questions, only: [:index, :create, :update] do
        end
        resources :decisions
      end
    end
  end

  mount ActionCable.server => '/cable'
end
