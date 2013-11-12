class User < ActiveRecord::Base
	validates :prename
    validates :surname
    validates :username
    validates :email,:format=>{ :with => //, :message=> I18n.t 'valid_email'}
    validates :password
end
