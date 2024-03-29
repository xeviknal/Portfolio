Portfolio::Application.routes.draw do
  root :to => redirect("/en")

  namespace :admin do
    resources :designs, :except => :edit do
      resources :images, :only => [:create, :update]
    end
    resources :images, :only => :destroy
  end

  scope "/:locale" do
    devise_for :users , :controllers => {:sessions => 'custom_devise/sessions'}, :skip => [:sessions] do
      get "sign_in", :to => "devise/sessions#new", :as => :new_user_session
      post "sign_in", :to => "devise/sessions#create", :as => :user_session
      delete "sign_out", :to => "devise/sessions#destroy", :as => :destroy_user_session
      get "sign_up", :to => "devise/registrations#new", :as => :new_user_registration
      get "edit_profile", :to => "devise/registrations#edit", :as => :edit_user_registration
      get "forgot_password", :to => "devise/passwords#new", :as => :new_user_password
    end

    root :to => 'designs#index'
    resources :designs, :only => [:index, :show], :path => '/'
  end
end
