Rails.application.routes.draw do

	scope "(:locale)", locale: /en|pl/ do

		devise_for :students
		root to: 'pages#home'

    resources :students, only: [:show, :index ] do
    end

	end

end
