Rails.application.routes.draw do
  
  get 'relationships/create'
  get 'relationships/destroy'
  resources :groups
  resources :volunteer_profiles
  resources :posts

  resources :experiences, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo-upload'
      get 'location'
    end
  end

  get '/my_experiences', to: 'experiences#personal_index'

  root 'basic_pages#home'

  get  '/help', to: 'basic_pages#help'
  get  '/explore', to: 'basic_pages#explore'
  get  '/about', to: 'basic_pages#about'
  get  '/blog', to: 'basic_pages#blog'
  get  '/privacy', to: 'basic_pages#privacy'
  get  '/team', to: 'basic_pages#team'
  get  '/terms', to: 'basic_pages#terms'
  get  '/faq', to: 'basic_pages#faq'
  

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }, path: '', :path_names => {sign_in: 'login', sign_out: 'logout', edit: 'settings', sign_up: 'registration'}
  
  # resources :users, only: [:show]

  resources :users, only: [:update] do
    member do
      get 'contact'
      get 'notification_settings'
    end
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships,       only: [:create, :destroy]


  resources :groups, only: [:update] do
    member do
      get 'group_location'
      get 'group_associations'
      get 'group_privacy'
    end
  end

  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
