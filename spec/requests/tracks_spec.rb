require 'rails_helper'

RSpec.describe "Tracks", type: :request do
  describe "GET api/tracks" do
    it "works! (now write some real specs)" do
      get api_tracks_path
      expect(response).to have_http_status(200)
    end
  end
end
