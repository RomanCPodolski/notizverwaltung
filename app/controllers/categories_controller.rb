class CategoriesController < ApplicationController
	def new
		#@category = Category.new
	end

	def create
		#@note = Note.find(params[:note_id])
		@category = @category.create!(category_params)
		@category.save
		redirect_to @category
	end

	def index
	end

	def destroy
	end

	private

	def category_params
		params.require(:category).permit(:name)
		
	end
end
