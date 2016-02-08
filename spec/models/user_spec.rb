require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(
      screen_name: Faker::Internet.user_name(nil, %w(_)),
      password: 'test123',
      email: Faker::Internet.email
    )

    @user2 = User.create(
      screen_name: 'hotboysontheinternet2009',
      password: 'test456',
      email: 'hotboys@internet.xxx'
    )
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
    @user.screen_name = 'hotboysontheinternet2009'
    expect { @user.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
