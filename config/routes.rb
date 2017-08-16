Rails.application.routes.draw do

  get 'expenses/new'

  get 'expenses/create'

  get 'expenses/edit'

  get 'expenses/update'

  get 'expenses/index'

  get 'expenses/show'

	scope "(:locale)", locale: /en|pl/ do
		root to: 'pages#home'
		
		devise_for :students
		resources :students, only: [:show, :index ]
		
		resources :rooms


    resources :students, only: [:show, :index ] do
    end

	end

end
