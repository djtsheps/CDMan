require "rails_helper"

RSpec.describe Api::V1::ArtistsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/artists").to route_to("api/v1/artists#index",:format => :json)
    end

    it "routes to #show" do
      expect(:get => "/api/artists/1").to route_to("api/v1/artists#show", :id => "1",:format => :json)
    end

    it "routes to #create" do
      expect(:post => "/api/artists").to route_to("api/v1/artists#create",:format => :json)
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/artists/1").to route_to("api/v1/artists#update", :id => "1",:format => :json)
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/artists/1").to route_to("api/v1/artists#update", :id => "1",:format => :json)
    end

    it "routes to #destroy" do
      expect(:delete => "/api/artists/1").to route_to("api/v1/artists#destroy", :id => "1",:format => :json)
    end

    it "routes to #search/artists" do
      expect(:get => "/api/search/artists").to route_to(:action => "search",:controller => "api/v1/artists",:format => :json)
    end

  end
end
