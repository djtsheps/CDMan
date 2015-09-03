require "rails_helper"

RSpec.describe Api::V1::TracksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/tracks").to route_to("api/v1/tracks#index",:format => :json)
    end

    it "routes to #new" do
      expect(:get => "/api/tracks/new").to route_to("api/v1/tracks#new",:format => :json)
    end

    it "routes to #show" do
      expect(:get => "/api/tracks/1").to route_to("api/v1/tracks#show", :id => "1",:format => :json)
    end

    it "routes to #edit" do
      expect(:get => "/api/tracks/1/edit").to route_to("api/v1/tracks#edit", :id => "1",:format => :json)
    end

    it "routes to #create" do
      expect(:post => "/api/tracks").to route_to("api/v1/tracks#create",:format => :json)
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/tracks/1").to route_to("api/v1/tracks#update", :id => "1",:format => :json)
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/tracks/1").to route_to("api/v1/tracks#update", :id => "1",:format => :json)
    end

    it "routes to #destroy" do
      expect(:delete => "/api/tracks/1").to route_to("api/v1/tracks#destroy", :id => "1",:format => :json)
    end

  end
end
