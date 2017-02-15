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
      get 'trails/:id/edit' => 'trails#edit'
    end
  end

end
