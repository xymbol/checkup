Rails.application.routes.draw do
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/signout' => 'sessions#destroy', as: :signout

  resources :places, only: %i(index) do
    collection do
      get 'checked'
      get 'not', action: :index_not
      get 'ok', action: :index_ok
    end
  end

  resources :places, path: '', only: %i(show) do
    member do
      patch 'not'
      patch 'ok'
    end
  end

  root 'welcome#index'
end
