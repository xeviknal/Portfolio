Portfolio::Application.routes.draw do
  devise_for :users do
    get "sign_in", :to => "devise/sessions#new", :as => :new_user_session
    get "sign_out", :to => "devise/sessions#destroy", :as => :destroy_user_session
    get "sign_up", :to => "devise/registrations#new", :as => :new_user_registration
    get "forgot_password", :to => "devise/passwords#new", :as => :new_user_password
  end

  root :to => 'static#index'
end
