class NotesController < ApplicationController
	
	def index
		@notes = Note.all
	end

	def new
	end

	def create
		#render message: params[:note].inspect
		@note = Note.new(note_params)
		
		if user_signed_in?
			@note.author_id = current_user.id
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
	 
	  if @note.update(note_params)
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
	  @notes = Note.search params[:search]
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
			    
				Note.create(:message => attributes)
			    #Note.create attributes["message"]
			end
		end
    	redirect_to notes_path
	end

	private
		def note_params
			params.require(:note).permit(:heading,:message)
		end
end