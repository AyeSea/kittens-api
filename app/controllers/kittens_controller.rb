class KittensController < ApplicationController
	before_action :dropdown_values, only: [:new, :edit]
	before_action :find_kitten, only: [:show, :edit, :update]

	def index
		@kittens = Kitten.all
	end

	def show
	end

	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.new(kitten_params)
		if @kitten.save
			flash[:success] = 'Kitten created!'
			redirect_to @kitten
		else
			flash.now[:error] = 'Error! Kitten not saved!'
			render 'new'
		end
	end

	def edit
	end

	def update
		if @kitten.update_attributes(kitten_params)
			flash[:success] = 'Kitten updated!'
			redirect_to @kitten
		else
			flash.now[:error] = 'Error! Kitten not updated!'
			render 'edit'
		end
	end

	def destroy
	end

	private
	def kitten_params
		params.require(:kitten).permit(:name, :age, :cuteness, :softness)
	end

	def dropdown_values
		@cuteness = [
								 ['Scares the Children', 1], ['Meh', 2], ['Cute', 3], 
		             ['Really Cute', 4], ['Extremely Cute', 5]
		            ]
		@softness = [
			           ['Like Sandpaper', 1], ['Meh', 2], ['Soft', 3], 
								 ['Really Soft', 4], ['Like Hugging a Cloud', 5]
								]
	end

	def find_kitten
		begin
			@kitten = Kitten.find(params[:id])
		rescue
			flash[:error] = "Sorry, that kitten doesn't exist!"
			redirect_to root_path
		end
	end

end
