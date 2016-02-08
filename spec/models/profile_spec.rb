require 'rails_helper'

RSpec.describe Profile, type: :model do
  before :each do
    @user = FactoryGirl.create(:user)
    @profile = FactoryGirl.create(:profile, user: @user)
  end

  it 'should have the same user id stored' do
    expect(@profile.user_id).to match @user.id
  end
end
