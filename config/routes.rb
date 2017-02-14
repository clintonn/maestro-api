Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'signup' => 'users#create'
      post 'login' => 'sessions#create'
      post 'trails/new' => 'trails#create'
      post 'sections/new' => 'sections#create'
    end
  end

end
