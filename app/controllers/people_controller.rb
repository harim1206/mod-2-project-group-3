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
     @person.username = "#{@person.full_name} #{@person.family.family_name}"
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
    # byebug
    @person = Person.find(params[:id])
    @memories = Memory.all
    @memories= current_user.family.memories

  end

  def edit
    @person = Person.find(params[:id])

  end

  def update
    @person = Person.find(params[:id])
    # byebug
    @person.update(person_params)


    redirect_to person_path(@person)

  end

  def destroy

    #need if statement to not be able to delete a person who has an account
   @person = Person.destroy(params[:id])
   redirect_to people_path
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :bio, :dob, :dod, :image_url)
  end
end
