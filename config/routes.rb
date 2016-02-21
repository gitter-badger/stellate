Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  # Routes for static pages:
  root 'static#index'
  get 'faq' => 'static#faq'
  get 'about' => 'static#about'
end
