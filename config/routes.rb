Rails.application.routes.draw do

	scope "(:locale)", locale: /en|pl/ do

		devise_for :students
		root 'pages#home'
		
	end

end
