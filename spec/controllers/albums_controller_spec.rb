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

   describe "GET #/api/search/albums => search" do
    it "assigns all first ablums as @albums if no filter params are set" do
      albums = Album.create! valid_attributes
      get :search, 'api/search/albums'
      expect(assigns(:albums)).to eq([albums])
    end

    it "should not match anything albums and return an empty array" do
      albums = Album.create! valid_attributes
      get :search, {controller: 'api/v1/albums', action: 'search', title: 'Tshepiso'}
      expect(assigns(:albums)).to eq([])
    end

    it "should return an album titled Tshepiso" do
      album = Album.create! valid_attributes
      valid_attributes[:title] = 'Tshepiso'
      album = Album.create! valid_attributes
      get :search, {controller: 'api/v1/albums', action: 'search', title: 'Tshepiso'}
      expect(assigns(:albums).first.title).to eq(album.title)
    end


    it "should return albums with 'rin' in their title" do
      albums = Album.create! valid_attributes
      get :search, {controller: 'api/v1/albums', action: 'search', title: 'rin'}
      expect(assigns(:albums)).to eq([albums])
    end
  end
end
