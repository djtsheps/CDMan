require "rails_helper"

RSpec.describe Api::V1::TracksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/tracks").to route_to("api/v1/tracks#index",:format => :json)
    end

    it "routes to #show" do
      expect(:get => "/api/tracks/1").to route_to("api/v1/tracks#show", :id => "1",:format => :json)
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

    it "routes to #search/tracks" do
      expect(:get => "/api/search/tracks").to route_to(:action => "search",:controller => "api/v1/tracks",:format => :json)
    end

    it "routes to #search/tracks" do
      expect(:post => "/api/albums/1/artists/1/tracks").to route_to(:action => "create_with_album_and_artist",:controller => "api/v1/tracks",:format => :json,  "album_ids"=>"1", "artist_ids"=>"1")
    end

  end
end
