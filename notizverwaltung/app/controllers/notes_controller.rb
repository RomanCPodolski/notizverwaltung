class NotesController < ApplicationController
	
	def index
		@notes = Note.all
	end

	def new
	end

	def create
		#render message: params[:note].inspect
		@note = Note.new(note_params)
		@note.save
		redirect_to notes_path
		#redirect_to @note
		#redirect_to action: :show, id:@note.id
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
		 	{:id => note.id, :text => note.message}
		end
    	send_data(@notelist.to_json, :filename => "export.json")
	end

	def import_json
	end

	private
		def note_params
			params.require(:note).permit(:message)
		end
end