Rails.application.routes.draw do
  root :to => 'static_pages#root'

  namespace :api do
    resources :runs, :only => [:new, :create, :index, :show]
    resources :users, :only => [:show, :new, :create, :index]
  end

  resource :session, :only => [:new, :create, :destroy]
end
