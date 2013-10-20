require "spec_helper"

describe BoardshortmessagesController do
  describe "routing" do

    it "routes to #index" do
      get("/boardshortmessages").should route_to("boardshortmessages#index")
    end

    it "routes to #new" do
      get("/boardshortmessages/new").should route_to("boardshortmessages#new")
    end

    it "routes to #show" do
      get("/boardshortmessages/1").should route_to("boardshortmessages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/boardshortmessages/1/edit").should route_to("boardshortmessages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/boardshortmessages").should route_to("boardshortmessages#create")
    end

    it "routes to #update" do
      put("/boardshortmessages/1").should route_to("boardshortmessages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/boardshortmessages/1").should route_to("boardshortmessages#destroy", :id => "1")
    end

  end
end
