class CommentsController < ApplicationController
  
  def new
  end

  def create
  	@comment = Comment.new(params)
    @note = Note.find(params[:note_id])
    redirect_to note_path(@note)
  end

  def index
  end

  def destroy
  end

  
end