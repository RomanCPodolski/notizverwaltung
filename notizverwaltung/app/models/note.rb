class Note < ActiveRecord::Base

	validates :message, presence: true, length: {minimum: 5}
	belongs_to :user

end
