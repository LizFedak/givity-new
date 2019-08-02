Rails.application.routes.draw do
  
  root 'basic_pages#home'

  get  '/help', to: 'basic_pages#help'
  get  '/explore', to: 'basic_pages#explore'
  get  '/about', to: 'basic_pages#about'
  get  '/blog', to: 'basic_pages#blog'
  get  '/privacy', to: 'basic_pages#privacy'
  get  '/team', to: 'basic_pages#team'
  get  '/terms', to: 'basic_pages#terms'
  get  '/faq', to: 'basic_pages#faq'

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  get 'posts/new'
  get 'posts/create'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'

  resources :posts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
