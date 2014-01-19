# Comment Model
class Comment < ActiveRecord::Base
  # associations to tables note and user
  belongs_to :note
  belongs_to :user
end
