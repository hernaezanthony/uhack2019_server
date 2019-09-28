Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    namespace :api, :defaults => { :format => :json } do

    	resources :user

    	  	get '/user/show' => 'user#show', :as => 'show_all_users'
    	  	post '/user/register' => 'user#register', :as => 'register'


    	resources :device

    		get '/device/show' => 'device#show', :as => 'show_all_devices'
    		post '/device/addDeviceToUser' => 'device#addDeviceToUser', :as => 'add_device'
    		get '/device/getUsersDevices/:user_id' => 'device#getUsersDevices', :as => 'get_users_devices'
    		post '/device/updateDeviceStatus/:id' => 'device#updateDeviceStatus', :as => 'updateDeviceStatus'
   


    end
end
