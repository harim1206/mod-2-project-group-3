class FamiliesController < ApplicationController
before_action :authorize, only: [:show, :edit, :update]

  def new
    @family = Family.new
  end

  def create
    @family = Family.create(family_account_params)
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

  def edit
    @family = Family.find(params[:id])
  end

  def update
    @family = current_user.family
    @family.update(family_params)
    if @family.valid?
      redirect_to people_path
    else
      flash[:errors] = @family.errors.full_messages
      redirect_to edit_family_path
    end
  end

  private

  def family_account_params
    params.require(:family).permit(:family_name, :family_info, :password, :password_confirmation)
  end

  def family_params
    params.require(:family).permit(:family_name, :family_info)
  end




end
