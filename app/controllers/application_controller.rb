class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    # byebug
    @current_user ||= Person.find(session[:person_id]) if session[:person_id]

  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end


end
