class CategoriesController < ApplicationController
	
	def new
		@category = Category.new		
	end

	def create
		@category = Category.new(category_params)

      if @category.save
        redirect_to new_note_path
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
        redirect_to new_note_path
      end
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
