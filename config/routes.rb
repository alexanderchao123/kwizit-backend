# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/authenticate_user', to: 'authentication#create'
      get '/authenticate_token', to: 'authentication#show'
      get '/authenticate_round/:pin', to: 'rounds#show'
      get '/rounds/:pin/count', to: 'rounds#count'
      resources :users

      resources :quizzes do
        resources :rounds, only: [:index, :create]
        resources :questions, only: [:create, :update]
      end

      resources :rounds, only: [:update], param: :pin do
        resources :admissions, only: [:index]
        resources :round_questions, only: [:index, :create, :update]
        resources :decisions, only: [:create, :show]
      end
    end
  end

  mount ActionCable.server => '/cable'
end
