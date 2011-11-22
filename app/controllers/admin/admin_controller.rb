class Admin::AdminController < ApplicationController
  before_filter :require_auth

  def require_auth
    redirect_to new_user_session_path unless user_signed_in?
  end
end
