class Admin::SizesController < Admin::BaseController
	def index
		@size = Size.new
		@sizes = Size.all
	end

	def create
		@size = Size.new(strong_params)
		if @size.save
			redirect_to admin_sizes_path, notice: 'Your size was succesfully created'
		else
			flash[:alert] = 'There was a problem saving your size'
			render 'index'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def strong_params
		params.require(:size).permit(:name)
	end
end