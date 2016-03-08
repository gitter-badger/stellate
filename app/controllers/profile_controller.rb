class ProfileController < ApplicationController
  before_filter :authenticate_user!

  def edit
  end

  def update
    profile_attributes = params.require(:profile).permit(:display_name,
                                                         :bio,
                                                         :location,
                                                         :website)

    if current_user.profile.update_attributes(profile_attributes)
      flash[:success] = "Your profile has been updated!"
    else
      flash[:error] = "An error occured while saving your profile!"
    end
    redirect_to edit_profile_path
  end
end
