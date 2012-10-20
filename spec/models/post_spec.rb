require 'spec_helper'

describe Post do
  let(:post) { FactoryGirl.build(:post) }
  it "has a valid factory" do
    post.should be_valid
  end

  it "is invalid without a subject" do
    post.subject = nil
    post.should_not be_valid
  end

  it "is invalid without content" do
    post.content = nil
    post.should_not be_valid
  end

  it "is invalid without a user" do
    post.user = nil
    post.should_not be_valid
  end
end
