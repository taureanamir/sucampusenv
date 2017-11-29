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

  get '/sucampusenv/ps6_doc'
  get 'suggestions', to: "sucampusenv#suggestions"
  get 'sucampusenv/ps5_doc'
  get 'sucampusenv/home'
  devise_for :users, :controllers => { registrations: 'registrations' }


  #PS4
  get 'sucampusenv/doc'
  get 'sucampusenv/show'
  get 'sucampusenv/index'
  get 'sucampusenv/new'
  get 'sucampusenv/edit'
  root 'sucampusenv#show'
  get '/sucampusenv/jenkins_mail'
  get '/sucampusenv/references'
  get 'db_dump_ps4', to: "sucampusenv#db_dump_ps4"

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