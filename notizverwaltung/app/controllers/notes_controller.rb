class NotesController < ApplicationController
	
	def index
		@notes = Note.all
	end

	def new
	end

	def create
		@note = Note.new(note_params)
		@note.save
		redirect_to @note
	end

	def show
		@note = Note.find(params[:id])
	end

	private
		def note_params
			params.require(:note).permit(:message)
		end
end