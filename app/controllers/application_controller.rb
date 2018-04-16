class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    Person.first
  end

  def index

  end
end
