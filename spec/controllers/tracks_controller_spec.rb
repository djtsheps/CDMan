require 'rails_helper'

RSpec.describe Api::V1::TracksController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:track)
  }

 let(:valid_session) { {} }
                                                                                                                                                                                                                                                                                
 describe "GET #/api/tracks => index" do
    it "assigns all first tracks as @tracks" do
      tracks = Track.create! valid_attributes                                                                                                                                                                                                                                 
      get :index, 'api/tracks'
      expect(assigns(:tracks)).to eq([tracks])
    end 

  describe "GET #/api/tracks/1 => show" do
    it "assigns first track as @track" do
      track = Track.create valid_attributes
      get :show, {controller: 'api/v1/tracks', action: 'show', id: track.id}
      expect(assigns(:track)).to eq(track)
    end 
  end
  end 
end
