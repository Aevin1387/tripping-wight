require 'spec_helper'

describe PostsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    let(:existing_post) { FactoryGirl.create :post }

    it "returns http success" do
      get 'show', id: existing_post
      response.should be_success
    end
  end

  describe "resources protected by authentication" do
    context "not logged in" do
      let(:post_record) { FactoryGirl.build :post }
      let(:existing_post) { FactoryGirl.create :post }

      describe "POST 'create'" do
        it "should redirect to login page" do
          post 'create', post_record
          response.should redirect_to new_user_session_path
        end
      end

      describe "GET 'new'" do
        it "returns http success" do
          get 'new'
          response.should redirect_to new_user_session_path
        end
      end

      describe "GET 'edit'" do
        it "returns http success" do 
          get 'edit', id: existing_post
          response.should redirect_to new_user_session_path
        end
      end

      describe "PUT 'update'" do
        it "returns http success" do
          existing_post.subject = "UpdatedSubject"
          put 'update', id: existing_post
          response.should redirect_to new_user_session_path
        end
      end

      describe "DELETE 'destroy'" do
        it "returns http success" do
          delete 'destroy', id: existing_post
          response.should redirect_to new_user_session_path
        end
      end
    end
  end
end
