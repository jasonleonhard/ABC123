Rails.application.routes.draw do
  resources :articles
  resources :layouts
  # resources :welcome
  #root 'welcome#index'
  # root 'articles#index'
  root 'articles#index'

end
