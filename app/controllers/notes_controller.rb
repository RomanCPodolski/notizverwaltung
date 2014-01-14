class NotesController < ApplicationController
	
	# get all notes to show on index view
	def index
		@notes = Note.all
	end

	# internal used ctor for notes
	# used by create method
	def new
	end

	# setup params to create a new note
	def create
		@note = Note.new do |u|
			u.heading = note_params[:heading]
			u.message = note_params[:message]
			u.due_at = note_params[:due_at]
			if user_signed_in?
				u.author_id = current_user.id
			end
			u.is_public = note_params[:is_public]
			u.signed_to_id = note_params[:signed_to]
			u.status_id = note_params[:status]
			u.category_id = note_params[:category]
		end

		@note.save
		redirect_to notes_path
	end

	# display a single note
	def show
		@note = Note.find(params[:id])
	end

	# call editor view for a single note
	def edit
		@note = Note.find(params[:id])
	end

	# update note data in db
	def update
	  @note = Note.find(params[:id])
	 
	  if @note.update(params[:note].permit(:heading, :message, :status_id))
	    #redirect_to @note
	    redirect_to notes_path
	  else
	    render 'edit'
	  end
	end

	# delete a note from db
	def destroy
		@note = Note.find(params[:id])
		@note.destroy
		redirect_to notes_path
	end

	# search a single note in db
	def search
	    #@notes = Note.search params[:search]
	    @notes = Note.where("message LIKE ? OR heading LIKE ?", "%"+params[:search]+"%", "%"+params[:search]+"%")
	end

	# get all notes from db, parse data to JSON format and download as file
	def export_json
		@notes = Note.all
		@notelist = @notes.map do |note|
		 	{
		 	 :heading => note.heading, 
		 	 :message => note.message, 
		 	 :author  => note.author_id,
		 	 :due_at  => note.due_at
		 	}
		end
    	send_data(@notelist.to_json, :filename => "Notizen.json")
	end

	# Upload and parse notes as JSON files, then import data into db
	# on note consists of: header, content, author, date
	def import_json
	  	uploaded_io = params[:filedata].tempfile
		File.open(uploaded_io, 'r') do |file|
			#render :text => uploaded_io.original_filename
		   	#file.write(uploaded_io.read)
			file.each do |line|
		    	attributes = JSON.parse line

				#Note.create(attributes)

				attributes = ActiveSupport::JSON.decode line

				@note = Note.new(heading: attributes[:heading],
								 message: attributes[:message],
				   				 author_id: attributes[:author],
				   				 due_at: attributes[:due_at])

				#@note = Note.new(heading: attributes[:heading])
				#@note.message = attributes[:message]
				#@note.author_id = attributes[:author]
				#@note.due_at = attributes[:due_at]
				#@note.save

				#note = Note.new do |n|
				#   n.heading = attributes[:heading]
				#   n.message = attributes[:message]
				#   n.author_id = attributes[:author]
				#   n.due_at = attributes[:due_at]
				#end
				#note.save
			end
		end
    	redirect_to notes_path
	end

	# upload media files
	# def media_upload
	# 	uploaded_io = params[:filedata].tempfile
	# 	file.write(uploaded_io.read)
	# 	render :text => "Die Datei: "+ uploaded_io.original_filename +" wurde gespeichert"
	# end

	# private method to parse method parameter hashes
	private
		def note_params
			params.require(:note).permit(:id,:heading,:message,:due_at,:signed_to,:status, :category, :is_public)
		end
end