class EmployersController < ApplicationController
  before_filter :authenticate_employer!

  def edit
    @employer = current_employer
  end

  def update
    @employer = current_employer
    @employer.update_attributes(params[:employer])
    if @employer.save
      redirect_to edit_employer_path(@employer), notice: "Profile updated successfully."
    else
      render :edit
    end
  end
end
