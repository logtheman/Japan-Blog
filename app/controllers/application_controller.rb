class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user , :logged_in?
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:login, keys: [:username, :email, :password, :remember_me])
  end

  def logged_in?
    !!current_user
  end


  def nav_link(text, link)
    recognized = Rails.application.routes.recognize_path(link)
    if recognized[:controller] == params[:controller] && recognized[:action] == params[:action]
        content_tag(:li, :class => "active") do
            link_to( text, link)
        end
    else
        content_tag(:li) do
            link_to( text, link)
        end
    end
  end

end
