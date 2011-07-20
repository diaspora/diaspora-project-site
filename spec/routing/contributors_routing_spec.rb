require "spec_helper"

describe ContributorsController do
  describe "routing" do

    it "routes to #index" do
      get("/contributors").should route_to("contributors#index")
    end

    it "routes to #new" do
      get("/contributors/new").should route_to("contributors#new")
    end

    it "routes to #show" do
      get("/contributors/1").should route_to("contributors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contributors/1/edit").should route_to("contributors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contributors").should route_to("contributors#create")
    end

    it "routes to #update" do
      put("/contributors/1").should route_to("contributors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contributors/1").should route_to("contributors#destroy", :id => "1")
    end

  end
end
