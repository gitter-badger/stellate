require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = FactoryGirl.create(:user)

    @user2 = FactoryGirl.create(:user)
  end

  subject { @user }

  it 'should return a string for email' do
    expect(@user.email).to be_instance_of String
  end

  it 'should return a string for the username' do
    expect(@user.screen_name).to be_instance_of String
    expect(@user.screen_name).to match /(\w|\d|_)+/
  end

  it 'should refuse to save the same username' do
    @user.screen_name = @user2.screen_name
    expect { @user.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
