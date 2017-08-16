Rails.application.routes.draw do


  scope "(:locale)", locale: /en|pl/ do

    namespace :admin do
      # Admin root
      root to: 'dashboard#index'

      resources :admin_users
      resources :students
      resources :rooms
      resources :tenancy_contracts
    end
    # Main root
		root to: 'pages#home'

    devise_for :admin_users, path: 'admin', controllers: { sessions: "admin_users/sessions" }

		devise_for :students, controllers: { sessions: "students/sessions", registrations: "students/registrations"}
		resources :students, only: [:show, :index]

		resources :rooms
    resources :announcements, only: [ :index, :create ]

  end

end

