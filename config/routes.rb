Rails.application.routes.draw do
  get 'users/new'
  root 'top_page#top'
  

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }



  # devise_scope :user do
  #   get 'users/confirmation/new', to: 'users/confirmations#new'
  #   post 'users/confirmation', to: 'users/confirmations#create'
  # end

  resources :users 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
