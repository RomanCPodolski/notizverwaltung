class CategoriesController < ApplicationController
	
	# create a new Category
	def new
		@category = Category.new		
	end

	# write a new Category to table category
	# redirect to the new note site
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

	# not needed shown method
	def index
	end

	# you cannot delete a category
	def destroy
	end

	private
	# private method for the category name
	def category_params
		params.require(:category).permit(:name)
		
	end
end
