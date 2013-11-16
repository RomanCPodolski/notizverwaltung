class CommentsController < ApplicationController
  def create
    @note = Post.find(params[:note_id])
    @comment = @note.comments.create(params[:comment].permit(:commenter, :comment))
    redirect_to note_path(@note)
  end
end