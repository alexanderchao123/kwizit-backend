Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/authenticate_user', to: "authentication#create"
      get '/authenticate_token', to: "authentication#show"
      get '/authenticate_round/:pin', to: "rounds#show"
      get '/rounds/:pin/current_question', to: "rounds#current_question"
      resources :users
      resources :guests
      resources :quizzes do
        resources :rounds, only: [:index, :create] do
          resources :round_questions, only: [:index, :create, :show]
          resources :decisions
        end
      end
    end
  end

  mount ActionCable.server => '/cable'
end
