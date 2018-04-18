class PeopleController < ApplicationController
  def index

    @people = current_user.family.people
  end

  def new
    @person = Person.new()
  end

  def create
     @person = Person.new(person_params)
     @person.family_id = current_user.family.id
     @person.username = "#{@person.first_name}#{@person.last_name}#{@person.family.family_name}"
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
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])

  end

  def update
    @person = Person.update(person_params)
    redirect_to person_path(@person)

  end

  def destroy
   @person = Person.destroy(params[:id])
   redirect_to people_path
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end
end
