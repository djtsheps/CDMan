require 'rails_helper'

RSpec.describe Api::V1::ArtistsController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:artist)
  }

 let(:valid_session) { {} }
                                                                                                                                                                                                                                                                                
 describe "GET #/api/artists" do
    it "assigns all first artists as @artists" do
      artists = Artist.create! valid_attributes
      get :index, 'api/artists'
      expect(assigns(:artists)).to eq([artists])
    end 
  end 
end
