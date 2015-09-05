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

  describe "GET #/api/search/artists?firstname=? => search" do
    it "assigns all first ablums as @artists if no filter params are set" do
      artists = Artist.create! valid_attributes
      get :search, {controller: 'api/v1/artists', action: 'search'}
      expect(assigns(:artists)).to eq([artists])
    end

    it "should not match anything artists and return an empty array" do
      artists = Artist.create! valid_attributes
      get :search, {controller: 'api/v1/artists', action: 'search', firstname: 'Tshepiso'}
      expect(assigns(:artists)).to eq([])
    end

    it "should return an artist with firstname as Tshepiso" do
      artist = Artist.create! valid_attributes
      valid_attributes[:firstname] = 'Tshepiso'
      artist = Artist.create! valid_attributes
      get :search, {controller: 'api/v1/artists', action: 'search', firstname: 'Tshepiso'}
      expect(assigns(:artists).first.firstname).to eq(artist.firstname)
    end

    it "should return artists with 'rin' in their title" do
      artists = Artist.create! valid_attributes
      get :search, {controller: 'api/v1/artists', action: 'search', firstname: 'rin'}
      expect(assigns(:artists)).to eq([artists])
    end
  end

  describe "GET #/api/search/artists?lastname=? => search" do
    it "should not match anything artists and return an empty array" do
      artists = Artist.create! valid_attributes
      get :search, {controller: 'api/v1/artists', action: 'search', lastname: 'Tshepiso'}
      expect(assigns(:artists)).to eq([])
    end

    it "should return an artist with lastname as Tshepiso" do
      artist = Artist.create! valid_attributes
      valid_attributes[:lastname] = 'Tshepiso'
      artist = Artist.create! valid_attributes
      get :search, {controller: 'api/v1/artists', action: 'search', lastname: 'Tshepiso'}
      expect(assigns(:artists).first.lastname).to eq(artist.lastname)
    end

    it "should return artists with 'rin' in their title" do
      artists = Artist.create! valid_attributes
      get :search, {controller: 'api/v1/artists', action: 'search', lastname: 'rin'}
      expect(assigns(:artists)).to eq([artists])
    end
  end

  describe "GET #/api/search/artists?aka=? => search" do
    it "should not match anything artists and return an empty array" do
      artists = Artist.create! valid_attributes
      get :search, {controller: 'api/v1/artists', action: 'search', aka: 'Tshepiso'}
      expect(assigns(:artists)).to eq([])
    end

    it "should return an artist with aka as Tshepiso" do
      artist = Artist.create! valid_attributes
      valid_attributes[:aka] = 'Tshepiso'
      artist = Artist.create! valid_attributes
      get :search, {controller: 'api/v1/artists', action: 'search', aka: 'Tshepiso'}
      expect(assigns(:artists).first.aka).to eq(artist.aka)
    end

    it "should return artists with 'rin' in their title" do
      artists = Artist.create! valid_attributes
      get :search, {controller: 'api/v1/artists', action: 'search', aka: 'rin'}
      expect(assigns(:artists)).to eq([artists])
    end
  end
end
