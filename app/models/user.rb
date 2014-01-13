class User < ActiveRecord::Base
	
	include Gravtastic
	gravtastic

  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :github] #:confirmable,

           has_many :notes, inverse_of: :author, foreign_key: :author_id , :class_name => "Note"
           has_many :notes_assigend, inverse_of: :signed_to, foreign_key: :signed_to_id , :class_name => "Note"
           has_many :comments

           def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
           	user = User.where(:provider => auth.provider, :uid => auth.uid).first
           	unless user
           		user = User.create(name:auth.extra.raw_info.name,
           			provider:auth.provider,
           			uid:auth.uid,
           			email:auth.info.email,
           			password:Devise.friendly_token[0,20]
           			)
           	end
           	user
           end

           def self.find_for_github_oauth(auth, signed_in_resource=nil)
           	data = access_token.info
           	user = User.where(:email => data["email"]).first

           	unless user
           		user = User.create(name: data["name"],
           			provider:auth.provider,
           			email: data["email"],
           			password: Devise.friendly_token[0,20]
           			)
           	end
           	user 
           end


           def self.new_with_session(params, session)
           	super.tap do |user|
           		if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
           			user.email = data["email"] if user.email.blank?
           		end
           	end
           end
           
       end
