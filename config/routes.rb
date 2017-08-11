Rails.application.routes.draw do

	scope "(:locale)", locale: /en|pl/ do
		root 'pages#home'
	end

end
