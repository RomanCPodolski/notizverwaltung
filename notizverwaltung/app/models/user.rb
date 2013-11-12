class User < ActiveRecord::Base
	validates :prename
    validates :surname
    validates :username
    validates :email,:format=>{ :with => /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/, :message=> I18n.t 'valid_email'}
    validates :password
end
