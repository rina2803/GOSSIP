Rails.application.routes.draw do
root 'home#index'
	resources :home
	resources :gossips do
	resources :comment end
	resources :user
	resources :city
	


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
