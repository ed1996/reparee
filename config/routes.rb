Rails.application.routes.draw do
  devise_for :users, :path=>'',
             :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'},
             :controllers=>{:registrations=>'registrations'}
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

  get 'vos_rendez_vous' => 'reservations#your_rdv'
  get 'vos_reservations' => 'reservations#your_reservations'

  get '/search' => 'pages#search'

end
