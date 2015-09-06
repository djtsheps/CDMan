class Api::BaseController < ApplicationController 
 # ParamError is superclass of ParamMissing, ParamInvalid
  rescue_from Apipie::ParamError do |e|
    render json: e.message, status: :unprocessable_entity
  end  
end
