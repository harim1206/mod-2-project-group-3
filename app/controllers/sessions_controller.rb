class SessionsController < ApplicationController
  before_action :authorize, only: [:show]

  def index

  end

  def new

  end

  def show
  end

  def create
    @person = Person.find_by_username(params[:username])
    if @person && @person.authenticate(params[:password])
      session[:person_id] = @person.id
      redirect_to '/'
    else
      flash[:error] = "You have entered the incorrect username or password."
      redirect_to '/login'
    end
  end

  def destroy
    session[:person_id] = nil
    redirect_to '/login'
  end
end
