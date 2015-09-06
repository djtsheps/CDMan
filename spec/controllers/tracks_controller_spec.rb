require 'rails_helper'

RSpec.describe Api::V1::TracksController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:track)
  }
  let(:album_valid_attributes) {
    attributes_for(:album)
  }
  let(:artist_valid_attributes) {
    attributes_for(:artist)
  }

 let(:valid_session) { {} }
                                                                                                                                                                                                                                                                                
 describe "GET #/api/tracks => index" do
    it "assigns all first tracks as @tracks" do
      tracks = Track.create! valid_attributes                                                                                                                                                                                                                                 
      get :index, 'api/tracks'
      expect(assigns(:tracks)).to eq([tracks])
    end 
  end

  describe "GET #/api/tracks/1 => show" do
    it "assigns first track as @track" do
      track = Track.create valid_attributes
      get :show, {controller: 'api/v1/tracks', action: 'show', id: track.id}
      expect(assigns(:track)).to eq(track)
    end 
  end

  describe "GET #/api/search/tracks => search" do
    it "assigns all first ablums as @tracks if no filter params are set" do
      tracks = Track.create! valid_attributes
      get :search, 'api/search/tracks'
      expect(assigns(:tracks)).to eq([tracks])
    end

    it "should not match anything tracks and return an empty array" do
      tracks = Track.create! valid_attributes
      get :search, {controller: 'api/v1/tracks', action: 'search', title: 'Tshepiso'}
      expect(assigns(:tracks)).to eq([])
    end

    it "should return an track titled Tshepiso" do
      track = Track.create! valid_attributes
      valid_attributes[:title] = 'Tshepiso'
      track = Track.create! valid_attributes
      get :search, {controller: 'api/v1/tracks', action: 'search', title: 'Tshepiso'}
      expect(assigns(:tracks).first.title).to eq(track.title)
    end


    it "should return tracks with 'rin' in their title" do
      tracks = Track.create! valid_attributes
      get :search, {controller: 'api/v1/tracks', action: 'search', title: 'rin'}
      expect(assigns(:tracks)).to eq([tracks])
    end
  end 
  
  describe "POST #/api/albums/1/artists/1/tracks => create_with_album_and_artist" do
    it "saves given track and its details" do
      album  = Album.create! album_valid_attributes
      artist = Artist.create! artist_valid_attributes
      get :create_with_album_and_artist, {controller: 'api/v1/tracks', action: 'show', artist_ids: artist.id,album_ids: album.id ,track: valid_attributes}
      expect(assigns(:track).id).to eq(1)
    end 

    it "does not saves given track and its details if there are no valid :artist_ids" do
      album  = Album.create! album_valid_attributes
      artist = Artist.create! artist_valid_attributes
      get :create_with_album_and_artist, {controller: 'api/v1/tracks', action: 'show', artist_ids: 3,album_ids: album.id ,track: valid_attributes}
      expect(assigns(:track).id).to eq(nil)
    end 

    it "does not saves given track and its details if there are no valid :album_ids" do
      album  = Album.create! album_valid_attributes
      artist = Artist.create! artist_valid_attributes
      get :create_with_album_and_artist, {controller: 'api/v1/tracks', action: 'show', artist_ids: artist.id,album_ids: 5 ,track: valid_attributes}
      expect(assigns(:track).id).to eq(nil)
    end 


    it "returns no album_ids and artist_ids found errors when incorrect album_ids and artist_ids are given" do
      album  = Album.create! album_valid_attributes
      artist = Artist.create! artist_valid_attributes
      get :create_with_album_and_artist, {controller: 'api/v1/tracks', action: 'show', artist_ids: 4,album_ids: 5 ,track: valid_attributes}
      expect(assigns(:track).errors.to_a).to eq(["Artist ids no artist(s) found","Album ids no album(s) found"])
    end 

    it "assigns given album to track" do
      track  = Track.create! valid_attributes
      album  = Album.create! album_valid_attributes
      artist = Artist.create! artist_valid_attributes
      get :create_with_album_and_artist, {controller: 'api/v1/tracks', action: 'show', artist_ids: artist.id,album_ids: album.id ,track: valid_attributes}
      expect(assigns(:track).albums).to eq([album])
    end 

    it "assigns given artist to track" do
      track  = Track.create! valid_attributes
      album  = Album.create! album_valid_attributes
      artist = Artist.create! artist_valid_attributes
      get :create_with_album_and_artist, {controller: 'api/v1/tracks', action: 'show', artist_ids: artist.id,album_ids: album.id ,track: valid_attributes}
      expect(assigns(:track).artists).to eq([artist])
    end 
  end
end
