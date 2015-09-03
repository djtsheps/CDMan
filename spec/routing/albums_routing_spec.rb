require "rails_helper"

RSpec.describe Api::V1::AlbumsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/albums").to route_to("api/v1/albums#index",:format => :json)
    end

    it "routes to #show" do
      expect(:get => "/api/albums/1").to route_to("api/v1/albums#show", :id => "1",:format => :json)
    end

    it "routes to #create" do
      expect(:post => "/api/albums").to route_to("api/v1/albums#create",:format => :json)
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/albums/1").to route_to("api/v1/albums#update", :id => "1",:format => :json)
    end


    it "routes to #destroy" do
      expect(:delete => "/api/albums/1").to route_to("api/v1/albums#destroy", :id => "1",:format => :json)
    end

  end
end
