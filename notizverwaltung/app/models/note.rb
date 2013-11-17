class Note < ActiveRecord::Base

	validates :message, presence: true, length: {minimum: 5}
	belongs_to :user
	has_many :comments

	def self.search(search)
	  search_condition = "%" + search + "%"
	  find(:all, :conditions => ['message LIKE ? OR id LIKE ?', search_condition, search_condition])
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
end
