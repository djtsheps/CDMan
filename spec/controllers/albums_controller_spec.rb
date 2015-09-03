require 'rails_helper'


RSpec.describe Api::V1::AlbumsController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:album)
  }

 let(:valid_session) { {} }

 describe "GET #/api/albums" do
    it "assigns all first ablum as @album" do
      albums = Album.create! valid_attributes
      get :index, 'api/albums'
      expect(assigns(:albums)).to eq([albums])
    end 
  end
end
