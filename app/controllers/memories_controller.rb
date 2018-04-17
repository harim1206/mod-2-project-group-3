class MemoriesController < ApplicationController
  before_action :authorize

  def index
    @family = current_user.family
    @memories = current_user.family.memories
  end

  def new
    @memory = Memory.new()
  end

  def create
    @memory = Memory.new(memory_params)
    @memory.family_id = current_user.family.id
    @memory.save
    redirect_to @memory
  end

  def show
    @memory = current_user.family.memories.find(params[:id])
  end

  def edit
    @memory = Memory.find(params[:id])


  end

  def update
    @memory = Memory.find(params[:id])
    @memory.update(memory_params)

    redirect_to @memory

  end

  private

  def memory_params

    params.require(:memory).permit(:title, :description, :image_url)
  end

end
