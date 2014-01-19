class Authorization < ActiveRecord::Base
	# association to table user
	belongs_to :user
end
