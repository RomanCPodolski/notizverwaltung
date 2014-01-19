class Note < ActiveRecord::Base

	validates :message, presence: true, length: {minimum: 5}
	validates :heading, presence: true

	# associations to other tabels
	belongs_to :author, inverse_of: :notes, :class_name => "User"
	belongs_to :signed_to, inverse_of: :notes_assigend, :class_name => "User"
	belongs_to :status
	belongs_to :category
	
	has_many :comments

	def self.save(upload)
		json =  upload['datafile'].original_filename
		datahash = JSON.parse(json)

		note = Note.new do |n|
			n.id = datahash['id']
			n.text = datahash['text']
			n.save
		end
	end

	def hasOwner? #Check ob diese Note jemandem gehört
		unless self.author_id.nil? || self.author_id == 0
			User.find(self.author_id)
		end

	end
end
