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
		@size = Size.find(params[:id])
	end

	def update
		@size = Size.find(params[:id])
		if @size.update(strong_params)
			redirect_to admin_sizes_path, notice: 'Size succesfully updated'
		else
			flash[:alert] = 'There was a problem updating your size'
			render 'edit'
		end
	end

	def destroy
		@size = Size.find(params[:id])
		@size.destroy
		redirect_to admin_sizes_path, notice: 'Size was succesfully deleted'
	end

	private

	def strong_params
		params.require(:size).permit(:name)
	end
end