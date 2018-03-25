Rails.application.routes.draw do
  resources :feelings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'feelings#index'
end
