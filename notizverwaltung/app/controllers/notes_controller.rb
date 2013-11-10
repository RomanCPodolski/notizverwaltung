class NotesController < ApplicationController
	def new
	end

	def create
		#render text: params[:note].inspect

		@note = Note.new(params[:note])
		@note.save
		redirect_to @note
	end
end
