class MemoriesController < ApplicationController
  before_action :authorize

  def index
    @family = current_user.family
    @memories = current_user.family.memories
  end



  def new
    @memory = Memory.new()
    @people = Person.all
  end



  def create
    @memory = Memory.new(memory_params)
    @memory.family_id = current_user.family.id

    @memory.save

    #create a new tag for each selected person
    params[:memory][:person_ids].each do |id|
      @memory.create_tag(id)
    end

    redirect_to @memory
  end



  def show
    @memory = current_user.family.memories.find(params[:id])
    @tagged_people = @memory.get_tagged_people
  end



  def edit
    @memory = Memory.find(params[:id])
    @people = Person.all

  end



  def update
    @memory = Memory.find(params[:id])
    @memory.update(memory_params)

    redirect_to @memory
  end

  def destroy
    # byebug
    Memory.destroy(params[:id])
    redirect_to memories_path
  end



  private

  def memory_params
    params.require(:memory).permit(:title, :description, :image_url)
  end

end
