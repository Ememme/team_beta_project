Rails.application.routes.draw do

	scope "(:locale)", locale: /en|pl/ do
		root to: 'pages#home'
		
		devise_for :students
		resources :students, only: [:show, :index ]
		
		resources :rooms

	end
end
