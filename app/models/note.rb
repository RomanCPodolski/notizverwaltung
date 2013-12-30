class Note < ActiveRecord::Base

	validates :message, presence: true, length: {minimum: 5}
	validates :heading, presence: true

	belongs_to :author, :class_name => "User"
	belongs_to :signed_to, :class_name => "User"
	
	has_many :comments


	def self.search(search)
	  search_condition = "%" + search + "%"
	  find(:all, :conditions => ['message LIKE ? OR heading LIKE ?', search_condition, search_condition])
	end

	def self.save(upload)
		json =  upload['datafile'].original_filename
		datahash = JSON.parse(json)

		note = Note.new do |n|
			n.id = datahash['id']
			n.text = datahash['text']
			n.save
		end
	end

	def hasOwner? #Check ob dieses Note jemandem gehört
		unless self.author_id.nil? || self.author_id == 0
			User.find(self.author_id)
		end

	end
end
