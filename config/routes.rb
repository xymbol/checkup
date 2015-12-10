Rails.application.routes.draw do
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/signout' => 'sessions#destroy', as: :signout

  resources :places, only: %i(index) do
    collection do
      get 'checked'
      get 'not'
      get 'ok'
    end
  end

  resources :places, path: '', only: %i(show) do
    resource :check, only: %i(update)
  end

  root 'welcome#index'

  namespace :api do
    get 'places/ok'
  end
end
