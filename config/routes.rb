Rails.application.routes.draw do
  namespace :users do
    get 'relationships/create'
    get 'relationships/destroy'
  end
  get 'relationships/create'
  get 'relationships/destroy'
	devise_for :users, :controllers => {
		:registrations => 'users/registrations',
		:sessions => 'users/sessions',
		:passwords => 'users/passwords',
	}

	get '/home/about' => "users/homes#about"
	get 'userinfos/new'

	root 'users/homes#top'

	scope module: :users do
	    resources :users, only: [:index, :show, :edit, :update] do
	      member do
	  	    get :unsubscribe
	  	  end
	      patch '/withdraw' => "users#withdraw"

	      get '/detailedit' => 'users#edit', as: :edit
	      patch '/detailupdate' => 'users#update', as: :update
		  resource :relationships, only: [:create, :destroy] do
		  	get :follows, on: :member
		  	get :followers, on: :member
		  end
		end

		resources :menus, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
		  resource :favorites, only: [:create, :destroy]
		  resources :menu_comments, only: [:create, :destroy]
		  get "search" => "menus#search"
		end
	end

	namespace :admins do
	    root 'users#top'
	    get '/search' => 'search#search'
	    resources :users, only: [:index, :edit, :show, :update]
	    resources :menus, only: [:index, :create, :new, :edit, :show, :update]
	    resources :genres, only: [:index, :create, :edit, :update]
	end

    devise_for :admins, :controllers => {
    	:registrations => 'admins/registrations',
    	:sessions => 'admins/sessions',
    	:passwords => 'admins/passwords',
    }
end
