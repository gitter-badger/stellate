require 'rails_helper'

RSpec.describe Role, type: :model do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  it 'should return true if the user has a specified role' do
    @user.add_role :admin
    expect(@user.has_role? :admin).to be true
  end

  it 'should return false if the user does not have a specified role' do
    @user.add_role :user
    expect(@user.has_role? :admin).to be false
  end
end
