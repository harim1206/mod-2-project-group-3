class FamiliesController < ApplicationController
before_action :authorize, only: [:show]

  def new
  end

  def create
  end

  def show
    @family = current_user.family
  end



end
