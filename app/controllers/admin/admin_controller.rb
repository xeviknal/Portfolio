class Admin::AdminController < GenericController
  before_filter :require_auth

  def default_url_options(options={})
     logger.debug "default_url_options is passed options: #{options.inspect}\n"
     options.merge( { :locale => I18n.locale.to_sym } )
  end

  def require_auth
    redirect_to new_user_session_path unless user_signed_in?
  end

  def index
    @design = Design.find(params[:id])
  end
end
