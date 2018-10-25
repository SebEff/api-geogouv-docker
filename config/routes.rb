require 'sidekiq/web'
Rails.application.routes.draw do
	get 'department', to: 'department#new'
 
  resources :department, only: [:new, :create]
	root 'department#new'
	mount Sidekiq::Web=> "/sidekiq"
	
	get 'results', to: 'results#show'
	resources :department, only: [:new, :create]
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end