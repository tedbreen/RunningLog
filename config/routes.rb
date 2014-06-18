Rails.application.routes.draw do
  root :to => 'static_pages#root'

  namespace :api do
    resources :runs do
      get 'page/:page', :action => :index, :on => :collection
    end
    
    resources :user_runs, :only => [:index] do
      get 'page/:page', :action => :index, :on => :collection
    end
    
    resources :users, :only => [:show, :new, :create, :index]
  end

  resource :session, :only => [:new, :create, :destroy]
end