require 'rails_helper'

RSpec.describe Api::V1::TracksController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:track)
  }

 let(:valid_session) { {} }
                                                                                                                                                                                                                                                                                
 describe "GET #/api/tracks" do
    it "assigns all first tracks as @tracks" do
      tracks = Track.create! valid_attributes                                                                                                                                                                                                                                 
      get :index, 'api/tracks'
      expect(assigns(:tracks)).to eq([tracks])
    end 
  end 
end
