class MemoriesController < ApplicationController
  before_action :authorize

  def index
    @family = current_user.family
    @memories = current_user.family.memories
  end

  def new
    @memory = Memory.new()
    @people = current_user.family.people
  end

  def create
    @memory = Memory.new(memory_params)
    @memory.family_id = current_user.family.id
    if @memory.valid?
      @memory.save
      params[:memory][:person_ids].each do |id|
        @memory.create_tag(id)
      end
      redirect_to @memory
    else
      flash[:errors] = @memory.errors.full_messages
      redirect_to new_memory_path
    end
  end

  def show
    @memory = Memory.find(params[:id])
    @tagged_people = @memory.get_tagged_people
  end

  def edit
    @memory = Memory.find(params[:id])
    @people = Person.all
  end

  def update
    @memory = Memory.find(params[:id])
    @memory.update(memory_params)
    if @memory.valid?
      redirect_to @memory
    else
      flash[:errors] = @memory.errors.full_messages
      redirect_to edit_memory_path
    end
  end

  def destroy
    Memory.destroy(params[:id])
    redirect_to memories_path
  end

  private

  def memory_params
    params.require(:memory).permit(:title, :description, :image_url)
  end

end
