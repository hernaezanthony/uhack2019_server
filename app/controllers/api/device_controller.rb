class Api::DeviceController < ApplicationController

skip_before_action :verify_authenticity_token
respond_to :json

	
	def intialize
  	    @http_status = 200
   		@http_response = {}
  	end

  	def index 
		devices = Device.all
		@http_response = devices
     	@http_status = 200
      	render :json => @http_response, :status => @http_status
    end

    def show
    	
    	devices = Device.all
		@http_response = devices
     	@http_status = 200
      	render :json => @http_response, :status => @http_status
    end

    def addDeviceToUser
    	

    	device = Device.new(device_params)

      	if device.save
            @http_response = device
            @http_status = 200
            status = true
      	else
        		@http_response = {
                      :result => "failed",
                      :message => "Error!"
                      }.to_json
        		@http_status = 400
            status = false
        end
          render :json => @http_response, :status => @http_status 

    end


    def getUsersDevices


    	devices = Device.where(user_id: params[:user_id])


    	if devices
    		@http_response = devices
			@http_status = 200
    		

    	else

    		@http_response = {
                      :result => "failed",
                      :message => "Error!"
                      }.to_json
        	@http_status = 400
        end
          render :json => @http_response, :status => @http_status 
    end	 


    def updateDeviceStatus

    	device = Device.find_by(id: params[:id])

    	if device
    		device.update_attribute(:status, params[:status])
    		device.update_attribute(:percentage, params[:percentage])
            
            @http_response = device
            @http_status = 200
    		

    	else

    		@http_response = {
                      :result => "failed",
                      :message => "Error!"
                      }.to_json
        	@http_status = 400
        end

            render :json => @http_response, :status => @http_status 

    end


    private 

    def device_params
    	
    	params.permit(:user_id, :serial_number ,:location)
    	
    end


end
