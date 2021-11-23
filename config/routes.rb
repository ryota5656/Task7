Rails.application.routes.draw do
    get"rooms/register"
    get "rooms/index"
    get"reservations/reservation"
    get "search" => "rooms#search"
   devise_scope :user do
        get '/users/sign_out' => 'devise/sessions#destroy'
    end
    

    
    # ログイン、アカウント編集後、任意のページに推移させるための記述
    devise_for :users, controllers: {
        registrations: 'users/registrations',
    }
    
    #:usersをshow
    resources :users, only: [:register]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :users
    resources :rooms
    
    resources :rooms do
        resources :reservations
    end
    
    
    
end
