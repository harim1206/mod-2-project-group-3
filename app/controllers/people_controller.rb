class PeopleController < ApplicationController
  before_action :authorize
  def index
    @people = current_user.family.people.sort_by{|person| person.dob.strftime("%Y%m%d").to_i}
    @family = current_user.family
  end

  def new
    @person = Person.new()
  end

  def create
     @person = Person.new(person_params)
     @person.family_id = current_user.family.id
     @person.username = "#{@person.full_name} #{@person.dob}"
     @person.password = "password"
     if @person.valid?
       @person.save
       redirect_to @person
     else
       flash[:errors] = @person.errors.full_messages
       redirect_to new_person_path
     end
   end

  def show
    if Person.find_by_id(params[:id])
      @person = Person.find(params[:id])
    else
      render "people/_noaccess.html.erb"
    end
  end

  def edit
    if Person.find_by_id(params[:id])
      @person = Person.find(params[:id])
    else
      render "people/_noaccess.html.erb"
    end
  end

  def update
  @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to person_path(@person)
    else
      flash[:errors] = @person.errors.full_messages
      redirect_to edit_person_path(@person)
    end
  end

  def destroy
   @person = Person.destroy(params[:id])
   redirect_to people_path
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :bio, :dob, :dod, :image)
  end
end
