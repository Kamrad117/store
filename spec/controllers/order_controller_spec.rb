require 'spec_helper'

describe OrderController do

  describe "GET 'user_id:integer'" do
    it "returns http success" do
      get 'user_id:integer'
      response.should be_success
    end
  end

  describe "GET 'price:integer'" do
    it "returns http success" do
      get 'price:integer'
      response.should be_success
    end
  end

  describe "GET 'notes:text'" do
    it "returns http success" do
      get 'notes:text'
      response.should be_success
    end
  end

  describe "GET 'contact:text'" do
    it "returns http success" do
      get 'contact:text'
      response.should be_success
    end
  end

end
