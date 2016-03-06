Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Routes for static pages:
  root 'static#index'
  get 'faq' => 'static#faq'
  get 'about' => 'static#about'

  get 'terms' => 'static#terms'
  get 'conduct' => 'static#coc'
  get 'datacollection' => 'static#datacollection'
  get 'privacy' => 'static#privacy'

  devise_for :users, path: 'user', skip: [:sessions, :registrations]
  as :user do
    # :sessions
    get '/login' => 'devise/sessions#new', as: :new_user_session
    post '/login' => 'devise/sessions#create', as: :user_session
    delete '/logout' => 'devise/sessions#destroy', as: :destroy_user_session
    # :registrations
    get 'settings/delete_account' => 'devise/registrations#cancel', as: :cancel_user_registration
    post '/user/create' => 'devise/registrations#create', as: :user_registration
    get '/register' => 'devise/registrations#new', as: :new_user_registration
    get '/settings/account' => 'devise/registrations#edit', as: :edit_user_registration
    patch '/settings/account' => 'devise/registrations#update', as: :update_user_registration
    put '/settings/account' => 'devise/registrations#update'
    delete '/settings/account' => 'devise/registrations#destroy'
  end
end
