require 'rails_helper'

RSpec.describe "Albums", type: :request do
  describe "GET /api/albums" do
    it "works! (now write some real specs)" do
      get api_albums_path
      expect(response).to have_http_status(200)
    end
  end
end
