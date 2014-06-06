Rails.application.routes.draw do
  root :to => 'static_pages#root'

  namespace :api do
    resources :runs, :only => [:new, :create, :show, :index, :destroy] do
      get 'page/:page', :action => :index, :on => :collection
      collection do
        get 'date_range'
      end
    end
    resources :users, :only => [:show, :new, :create, :index]
  end

  resource :session, :only => [:new, :create, :destroy]
end
