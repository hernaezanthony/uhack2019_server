class Api::UserController < ApplicationController


skip_before_action :verify_authenticity_token
respond_to :json

	
	def intialize
  	    @http_status = 200
   		@http_response = {}
  	end

	def index 
		users = User.all
		@http_response = users
     	@http_status = 200
      	render :json => @http_response, :status => @http_status
    end

    def show
		jobs = User.all
		@http_response = jobs
     	@http_status = 200
      	render :json => @http_response, :status => @http_status
    end

    def register
      	user = User.new(user_params)
      	if user.save
            @http_response = user
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


    private

  	def user_params
    	 params.permit(:email,:password, :password_confirmation)
 	end
end
