Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'signup' => 'users#create'
      post 'login' => 'sessions#create'
      post 'search/trails' => 'search#trails'
      delete 'login' => 'sessions#destroy'
      resources :trails do
        resources :sections do
          resources :resources
        end
      end
      resources :users, except: :create
      post 'users/auth' => 'users#auth'
      get 'trails/:id/edit' => 'trails#edit'
      get 'categories/all' => 'categories#index'
      delete 'logoff' => 'sessions#destory'
      get 'users/:user_id/trails' => 'trails#index'
      post 'trails/:trail_id/votes/:user_id' => 'votes#create'
      post 'trails/:trail_id/follows/:user_id' => 'follows#create'
      delete 'trails/:trail_id/follows/:user_id' => 'follows#destroy'
    end
  end

end
