class NotesController < ApplicationController
	
	def index
		@notes = Note.all
	end

	def new
	end

	def create
		
		@note = Note.new do |u|
			u.heading = note_params[:heading]
			u.message = note_params[:message]
			u.due_at = note_params[:due_at]
			if user_signed_in?
				u.author_id = current_user.id
			end
			u.signed_to_id = note_params[:signed_to]
			u.status_id = note_params[:status]
		end

		@note.save
		redirect_to notes_path
	end

	def show
		@note = Note.find(params[:id])
	end

	def edit
		@note = Note.find(params[:id])
	end

	def update
	  @note = Note.find(params[:id])
	 
	  if @note.update(params[:note].permit(:heading, :message, :status_id))
	    #redirect_to @note
	    redirect_to notes_path
	  else
	    render 'edit'
	  end
	end

	def destroy
		@note = Note.find(params[:id])
		@note.destroy
		redirect_to notes_path
	end

	def search
	    #@notes = Note.search params[:search]
	    @notes = Note.where("message LIKE ? OR heading LIKE ?", "%"+params[:search]+"%", "%"+params[:search]+"%")
	end

	def export_json
		@notes = Note.all
		@notelist = @notes.map do |note|
		 	{:id => note.id, :message => note.message}
		end
    	send_data(@notelist.to_json, :filename => "Notizen.json")
	end

	def import_json
	  	uploaded_io = params[:filedata].tempfile
		File.open(uploaded_io, 'r') do |file|
			#render :text => uploaded_io.original_filename
		   	#file.write(uploaded_io.read)
			file.each do |line|
		    	attributes = JSON.parse line
			    
				Note.create(attributes)		# :message => 
			    #Note.create attributes["message"]
			end
		end
    	redirect_to notes_path
	end

	private
		def note_params
			params.require(:note).permit(:id,:heading,:message,:due_at,:signed_to,:status)
		end
end