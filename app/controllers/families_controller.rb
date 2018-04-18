class FamiliesController < ApplicationController
before_action :authorize, only: [:show]

  def new
    @family = Family.new
  end

  def create
    @family = Family.create(family_params)
    if @family.save
      redirect_to signup_path
    else
      flash[:errors] = @family.errors.full_messages
      redirect_to new_family_path
    end
  end

  def show
    @family = current_user.family
  end

  private

  def family_params
    params.require(:family).permit(:family_name, :family_info, :password, :password_confirmation)
  end



end
