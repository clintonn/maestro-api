Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'signup' => 'users#create'
      post 'login' => 'sessions#create'
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
    end
  end

end
