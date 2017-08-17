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

    devise_for :admin_users, skip: [:registrations], path: 'admin', controllers: { sessions: "admin_users/sessions" }
    as :admin_user do
      get '/setup', to: 'admin_users/registrations#new', as: :new_setup_admin
      post '/setup', to: 'admin_users/registrations#create', as: :setup_admin
    end

		devise_for :students, path_names: { sign_up: ''}, controllers: { sessions: "students/sessions", invitations: 'students/invitations'}
		resources :students, only: [:show, :index]

		resources :rooms

    resources :announcements, only: [ :index, :create ] do
      resources :comments
    end

	  resources :expenses
    post "expenses/:id/pay", to: "expenses#pay"

  end

end
