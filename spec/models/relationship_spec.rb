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

  it "should destroy all relationships after blocking" do
    @user.follow @user2
    @user2.follow @user
    @user.block @user2
    expect(@user.following?(@user2)).to be false
    expect(@user2.following?(@user)).to be false
  end

  it "should not create a relationship if the user is blocked" do
    @user.block @user2
    @user2.follow @user
    expect(@user2.following?(@user)).to be false
  end

  it "should be able to create relationships if the user is unblocked" do
    @user.block @user2
    @user.unblock @user2
    @user2.follow @user
    expect(@user2.following?(@user)).to be true
  end

  it "should return true if the user is blocked" do
    @user.block @user2
    expect(@user.blocked?(@user2)).to be true
  end

  it "should return true if the relationship is mutual" do
    @user.follow @user2
    @user2.follow @user
    expect(@user.mutual?(@user2)).to be true
  end
end
