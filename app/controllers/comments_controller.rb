class CommentsController < ApplicationController
  
  def new
  end

  def create

    @note = Note.find(params[:note_id])
    @comment = @note.comments.create!(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @note

  #	@comment = Comment.new do |c|
  #    c.heading =  comment_params[:heading]
  #    c.body =  comment_params[:body]
  #    if user_signed_in?
  #      c.user_id = current_user.id
  #    end
  #    c.note_id = comment_params[:note_id]
  #  end
  #  @comment.save
  #  @note = Note.find(comment_params[:note_id])
  #  redirect_to note_path(@note)
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