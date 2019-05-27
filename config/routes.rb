Rails.application.routes.draw do
  resources :objectives, only: [:index, :create] do
    resources :key_results, only: [:create]
  end
  mount RailsEventStore::Browser => '/res' if Rails.env.development?
  root 'objectives#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
