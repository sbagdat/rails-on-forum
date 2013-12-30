RailsOnForum::Application.routes.draw do
  get '/users/new', to: redirect('/kaydol')
  get '/kaydol', to: 'users#new', as: :register

  resources :users, except: :index
end
