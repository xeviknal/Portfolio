class FrontController < ApplicationController
  before_filter :set_locale
  before_filter :check_locale

  #rescue_from ActionController::RoutingError, :with => :render_404

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def check_locale
    return unless params[:locale]

    if !I18n.available_locales.include?(params[:locale].to_sym)
      raise ActionController::RoutingError, "invalid route"
    end
  end

  def default_url_options(options={})
     logger.debug "default_url_options is passed options: #{options.inspect}\n"
     options.merge( { :locale => I18n.locale.to_sym } )
  end

  private

  def render_404(e)
    redirect_to "/404.html"
  end
end
