class CommentsController < ApplicationController
  def create
    @note = Note.find(params[:note_id])
    @comment = @note.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to note_path(@note)
  end

  def index
  end

  
end