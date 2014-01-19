class Category < ActiveRecord::Base
	# association to table notes
	has_many :notes
end
