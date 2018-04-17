class FamiliesController < ApplicationController
before_action :authorize, only: [:show]

  def show
    @family = current_user.family
  end



end
