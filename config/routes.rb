RailsOnForum::Application.routes.draw do
  get '/users/new', to: redirect('/kaydol')
  get '/kaydol',    to: 'users#new',  as: :register

  get '/:id',       to: 'users#show', as: :profile
  get '/:id/edit', to: 'users#edit', as: :edit_profile

  resources :users, except: :index
end
