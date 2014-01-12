class CommentsController < ApplicationController
  
  def new
  end

  def create

    @note = Note.find(params[:note_id])
    @comment = @note.comments.create!(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to :back

  end

  def index
  end

  def destroy
  end

  private
  
    def comment_params
      params.require(:comment).permit(:heading,:body)
    end

  
end