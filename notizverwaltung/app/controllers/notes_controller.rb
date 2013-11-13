class NotesController < ApplicationController
	

	def new
	end

	def create
		#render text: params[:note].inspect
		@note = Note.new(note_params)
		@note.save
		redirect_to @note
	end

	def show
		@note = Note.find(params[:id])
	end

	private
		def note_params
			params.require(:note).permit(:text)
		end
end
