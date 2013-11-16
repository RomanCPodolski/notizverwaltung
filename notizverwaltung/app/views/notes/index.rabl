# --> http://blog.thecodepath.com/2011/06/27/building-a-platform-api-on-rails/

# app/views/notes/index.rabl
object @notes
 
# Reuse the show template definition
extends "notes/show"
 
# Let's add an "id" resource for the index action
attributes :id