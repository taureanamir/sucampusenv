Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :articles
  resources :pages
  get 'sucampusenv/articles_list'
  get 'sucampusenv/my_articles'

  resources :events do
    resources :comments
    resources :participations
  end

  get 'sucampusenv/home'
  devise_for :users, :controllers => { registrations: 'registrations' }


  #PS4
  get 'sucampusenv/doc'
  get 'sucampusenv/show'
  root 'sucampusenv#home'


  devise_scope :user do
    authenticated :user do
      root 'sucampusenv#home', as: :authenticated_root
    end
    unauthenticated do
      root 'sucampusenv#home', as: :unauthenticated_root
    end
  end
  #devise_for :users
  #resources :sucampusenv
  resources :users
  get 'sucampusenv/participants_list'
end