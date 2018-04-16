class FamiliesController < ApplicationController


  def show
    @family = Family.find(1)
    

  end



end
