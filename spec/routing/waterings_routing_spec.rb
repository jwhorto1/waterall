require "spec_helper"

describe WateringsController do
  describe "routing" do

    it "routes to #index" do
      get("/waterings").should route_to("waterings#index")
    end

    it "routes to #new" do
      get("/waterings/new").should route_to("waterings#new")
    end

    it "routes to #show" do
      get("/waterings/1").should route_to("waterings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/waterings/1/edit").should route_to("waterings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/waterings").should route_to("waterings#create")
    end

    it "routes to #update" do
      put("/waterings/1").should route_to("waterings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/waterings/1").should route_to("waterings#destroy", :id => "1")
    end

  end
end
