class CommentsController < ApplicationController
  
  def new
  end

  # saves the written comment to the note.
  # also saves the author of the note
  def create

    @note = Note.find(params[:note_id])
    @comment = @note.comments.create!(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to :back

  end

  # not needed method for listing all comments
  def index
  end

  # not needed method to delete the comments
  def destroy
  end

  private
  
    # private method to get the written comment
    def comment_params
      params.require(:comment).permit(:heading,:body)
    end

  
end