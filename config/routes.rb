RailsOnForum::Application.routes.draw do
  get    '/oturum_ac',     to: 'sessions#new',     as: :login
  delete '/oturumu_kapat', to: 'sessions#destroy', as: :logout
  resource  :session, only: :create

  resources :forums, only: [:index, :show], path: 'forumlar' do
    resources :topics, only: [:new, :create],
                       path: 'konular',
                       path_names: {new: 'yeni'}
  end

  resources :topics, except: [:index, :new, :create],
                     path: 'konular', path_names: {edit: 'duzenle'} do
    resources :comments, only: [:new, :create],
                         path: 'yorumlar',
                         path_names: {new: 'yeni'}
  end

  resources :comments, only: [:edit, :update, :destroy],
                       path: 'yorumlar',
                       path_names: {edit: 'duzenle'}

  resources :users,   only: [:create, :update, :destroy]
  get '/kaydol',      to: 'users#new',  as: :register
  get '/:id',         to: 'users#show', as: :profile
  get '/:id/duzenle', to: 'users#edit', as: :edit_profile

  root 'forums#index'
end
