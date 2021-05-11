Rails.application.routes.draw do
  get 'factures/index'

  get 'factures/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :path=>'',
             :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'},
             :controllers=>{:registrations=>'registrations',
             :confirmations=>'confirmations'
             }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'pages#home'
  resources :users, only: [:show]
  resources :entreprises do
    resources :reservations, only: [:create]
    resources :reviews, only: [:create, :destroy]
  end
  resources :photos

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end


  resources :subscribers
  resources :premiums
  resources :contacts, only: [:new, :create]

  match "/404" => "errors#error404", via: [:get, :post, :patch, :delete]

  get 'vos_rendez_vous' => 'reservations#your_rdv'
  get 'vos_reservations' => 'reservations#your_reservations'

  get '/search' => 'pages#search'
  get '/faq' => 'pages#faq'
  get '/team' => 'pages#team'
  get '/features' => 'pages#features'
  get '/success' => 'pages#success'
  get '/abonnement' => 'pages#abonnement'
  get '/accueilsaas' => 'pages#homesaas'
  get '/politique-de-confidentialite' => "pages#politique"
  get '/mentions-legales' => "pages#mentions"
  get '/cgv' => "pages#cgv"

  resources :factures, only: [:index, :show]

end
