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
      flash[:success] = t('flashes.profile.success')
    else
      flash[:error] = t('flashes.profile.error')
    end
    redirect_to edit_profile_path
  end
end
