Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  resources :articles
  resources :layouts
  # resources :welcome
  #root 'welcome#index'
  # root 'articles#index'
  root 'articles#index'

end
