Rails.application.routes.draw do
  
  resources :profiles
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

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
