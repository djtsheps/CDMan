require 'rails_helper'


RSpec.describe Api::V1::AlbumsController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:album)
  }

 let(:valid_session) { {} }

 describe "GET #/api/albums => index" do
    it "assigns all first ablums as @albums" do
      albums = Album.create! valid_attributes
      get :index, 'api/albums'
      expect(assigns(:albums)).to eq([albums])
    end 
  end

  describe "GET #/api/albums/1 => show" do
    it "assigns first ablum as @album" do
      album = Album.create! valid_attributes
      get :show, {controller: 'api/v1/albums', action: 'show', id: album.id}
      expect(assigns(:album)).to eq(album)
    end 
  end
end
