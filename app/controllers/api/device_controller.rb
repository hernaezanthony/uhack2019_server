class Api::DeviceController < ApplicationController

skip_before_action :verify_authenticity_token
respond_to :json

	
	def intialize
  	    @http_status = 200
   		@http_response = {}
  	end

  	

end
