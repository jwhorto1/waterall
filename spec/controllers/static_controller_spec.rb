require 'spec_helper'

describe StaticController do

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'social'" do
    it "returns http success" do
      get 'social'
      response.should be_success
    end
  end

  describe "GET 'tos'" do
    it "returns http success" do
      get 'tos'
      response.should be_success
    end
  end

  describe "GET 'blog'" do
    it "returns http success" do
      get 'blog'
      response.should be_success
    end
  end

end
