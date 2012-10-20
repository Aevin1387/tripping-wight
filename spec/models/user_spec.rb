require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }
  it "has a valid factory" do
    user.should be_valid
  end

  it "is invalid without a name" do
    user.name = nil
    user.should_not be_valid
  end
end