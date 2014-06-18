require 'spec_helper'

describe Goldencobra::Api::V2::ArticlesController do
  before(:each) { @routes = Goldencobra::Engine.routes }

  describe 'POST #create' do

    describe 'without an user who is logged in' do

      before do
        get :create,
             format: :json
      end

      it "should return a json status forbidden" do
        response.response_code.should == 403
      end

    end

  end

  describe 'with an user who is logged in' do

    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      sign_in @user

      get :create,
           :article => {
               name: 'fdf'
           },
           format: :json
    end

    it "should return a json status forbidden" do
      response.response_code.should == 403
    end

  end


end