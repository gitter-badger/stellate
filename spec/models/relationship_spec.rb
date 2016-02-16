require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before :each do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
  end

  it "should be able to be created between two users" do
    @user.follow @user2
    expect(@user.following?(@user2)).to be true
  end

  it "should be able to be destroyed between two users" do
    @user.follow @user2
    @user.unfollow @user2
    expect(@user.following?(@user2)).to be false
  end

  it "should not be able to create a relationship with the same user twice" do
    @user.follow @user2
    expect{ @user.follow @user2 }.to raise_error(ActiveRecord::RecordNotUnique)
  end
end
