# --> http://blog.thecodepath.com/2011/06/27/building-a-platform-api-on-rails/

# app/views/users/show.rabl
object @note
 
# Declare the properties to include
attributes :message, :id
 
# Alias 'age' to 'years_old'
attributes :message => :text
 
# Include a custom node with full_name for note
#node :full_name do |note|
  #[note.first_name, note.last_name].join(" ")
#end
 
# Include a custom node related to if the note can drink
#node :can_drink do |note|
  #note.age >= 21
#end