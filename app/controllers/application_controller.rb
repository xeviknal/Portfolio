class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :check_locale

  rescue_from Exception, :with => :handle_exceptions

  def handle_exceptions(e)
    case e
    #handling exception of ActionController::RoutingError
    when ActionController::RoutingError
      redirect_to "/404.html"
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def check_locale
    if params[:locale].blank? || I18n.available_locales.select{ |l| l == params[:locale].to_sym }.blank?
      raise ActionController::RoutingError, "invalid route"
    end
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    options.merge( { :locale => I18n.locale.to_sym } )
  end
end
