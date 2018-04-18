class SessionsController < ApplicationController
  before_action :authorize, only: [:show]

  def newaccount
    @person = Person.new()
    @families = Family.all
    render "sessions/newaccount.html.erb"
  end

  def createaccount
    @person = Person.new(person_params)
    @person.is_account = true
    if params[:person][:family_id] != ""
      @family = Family.find(params[:person][:family_id])
    end
    if @person.valid? && @family.authenticate(params[:person][:family_password])
      @person.save
      session[:person_id] = @person.id
      redirect_to '/'
    elsif @person.valid?
      flash[:errors] = ["You have typed the incorrect family password."]
      redirect_to signup_path
    else
      flash[:errors] = @person.errors.full_messages
      redirect_to signup_path
    end
  end

  def accounttype
    render "sessions/whichaccount.html.erb"
  end

  def choosefamily
    @families = Family.all
    render "sessions/existingfamily.html.erb"
  end

  def choosemember
    if params[:family][:family_id] != ""
      family = Family.find(params[:family][:family_id])
      @people = family.people.select do |person|
        !person.is_account
      end
      if family.authenticate(params[:family_password])
        render "sessions/existingmember.html.erb"
      else
        flash[:error] = "You typed an incorrect family password!"
        redirect_to choosefamily_path
      end
    else
      flash[:error] = "You need to choose a family!"
      redirect_to choosefamily_path
    end
  end

  def index
  end

  def new
  end

  def show

      @memories = Memory.all
      @memories= current_user.family.memories

      @random = []
      count = 0
      while count < 3 do
       random_memory = @memories.sample
       if !@random.include?(random_memory)
         @random << random_memory
         count += 1
       end
      end


      # byebug

  end

  def edit
    @person = Person.find(params[:person][:person_id])
    render "sessions/edit.html.erb"
  end

  def update
    @person = Person.find(params[:person][:id])
    @person.update(account_params)
    if @person.valid?
      @person.update(is_account: true)
      session[:person_id] = @person.id
      redirect_to '/'
    else
      redirect_to choosefamily_path
    end
  end

  def create
    @person = Person.find_by_username(params[:username])
    if @person && @person.authenticate(params[:password]) && @person.is_account
      session[:person_id] = @person.id
      redirect_to '/'
    else
      flash[:error] = "You have entered the incorrect username or password."
      redirect_to '/login'
    end
  end

  def edit
    @current_user = Person.find(session[:person_id])


    # byebug
  end

  def destroy
    session[:person_id] = nil
    redirect_to '/login'
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name,
      :username, :password, :password_confirmation, :family_id)
  end

  def account_params
    params.require(:person).permit(:username, :password, :password_confirmation)
  end

end
