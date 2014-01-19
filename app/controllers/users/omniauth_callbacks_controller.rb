# This Contoller handles callbacks from third party websites,
# like facebook, google or github. It's part of the communication with Devise, Ominauth
# and the authentication-oauth2-system of the app
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	# Handles the callback hash from Facebook for authentification.
	# It finds or creates the user in the Database and starts a new session.
	# Also a flash message will be set for success or fails
	def facebook
		# You need to implement the method below in your model (e.g. app/models/user.rb)
		@user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

		if @user.persisted?
		  sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
		  set_flash_message(:notice, :success, :kind => 'Facebook') if is_navigational_format?
		else
		  session["devise.facebook_data"] = request.env["omniauth.auth"]
		  redirect_to new_user_registration_url
		end
  	end
	
	# Handles the callback hash from Google for authentification.
	# It finds or creates the user in the Database and starts a new session.
	# Also a flash message will be set for success or fails
	def google
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  	end

  	# Handles the callback hash from Github for authentification.
	# It finds or creates the user in the Database and starts a new session.
	# Also a flash message will be set for success or fails
  	def github
  		@user = User.find_for_github_oauth(request.env["omniauth.auth"], current_user)

		if @user.persisted?
			logger.debug "USER PERSISTED"
		  sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
		  set_flash_message(:notice, :success, :kind => 'Github') if is_navigational_format?
		else
			logger.debug "SMTH WENT WRONG"
		  session["devise.github_data"] = request.env["omniauth.auth"]
		  redirect_to new_user_registration_url
		end
  	end

end