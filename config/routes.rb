Rails.application.routes.draw do

	devise_for :users, controllers: {
			sessions: 'registrations/sessions',
			registrations: 'registrations/registrations'
	}

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: "home#index"


	resources :users do
		resource :accounts, only: [:show, :update]
		resource :profile, only: [:show, :update, :destroy]
	end

end
