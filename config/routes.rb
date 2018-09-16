Rails.application.routes.draw do
  devise_for :users
	namespace :v1 do
		resources :contacts
		resources :transfers
		resources :sessions, only: [:create, :destroy, :update] do
			
		end
	end 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
