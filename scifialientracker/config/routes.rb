Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :aliens
    end
  end
  # get 'aliens/create'
  # get 'aliens/update'
  # get 'aliens/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
