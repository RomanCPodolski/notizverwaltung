class Note < ActiveRecord::Base

	validates :message, presence: true, length: {minimum: 5}
	belongs_to :user

	def self.search(search)
	  search_condition = "%" + search + "%"
	  find(:all, :conditions => ['message LIKE ? OR id LIKE ?', search_condition, search_condition])
	end

end
