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
    @person.save

    redirect_to @person

  end

  def show
    @person = Person.find(params[:id])
  end

  def edit

  end




  private

  def person_params
    params.require(:person).permit(:first_name)
  end
end
