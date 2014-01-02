RailsOnForum::Application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  get    '/oturum_ac',     to: 'sessions#new',     as: :login
  delete '/oturumu_kapat', to: 'sessions#destroy', as: :logout

  get '/users/new', to: redirect('/kaydol')
  get '/kaydol',    to: 'users#new',  as: :register

  get '/:id',       to: 'users#show', as: :profile
  get '/:id/edit', to: 'users#edit', as: :edit_profile

  resources :users, except: :index
end
