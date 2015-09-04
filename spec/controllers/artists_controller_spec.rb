require 'rails_helper'

RSpec.describe Api::V1::ArtistsController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:artist)
  }

 let(:valid_session) { {} }
                                                                                                                                                                                                                                                                                
 describe "GET #/api/artists => index" do
    it "assigns all first artists as @artists" do
      artists = Artist.create! valid_attributes
      get :index, 'api/artists'
      expect(assigns(:artists)).to eq([artists])
    end 
  end

  describe "GET #/api/artists/1 => show" do
    it "assigns first artist as @artist" do
      artist = Artist.create valid_attributes
      get :show, {controller: 'api/v1/artists', action: 'show', id: artist.id}
      expect(assigns(:artist)).to eq(artist)
    end 
  end
end
