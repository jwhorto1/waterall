require "spec_helper"

describe WaterallboardsController do
  describe "routing" do

    it "routes to #index" do
      get("/waterallboards").should route_to("waterallboards#index")
    end

    it "routes to #new" do
      get("/waterallboards/new").should route_to("waterallboards#new")
    end

    it "routes to #show" do
      get("/waterallboards/1").should route_to("waterallboards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/waterallboards/1/edit").should route_to("waterallboards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/waterallboards").should route_to("waterallboards#create")
    end

    it "routes to #update" do
      put("/waterallboards/1").should route_to("waterallboards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/waterallboards/1").should route_to("waterallboards#destroy", :id => "1")
    end

  end
end
