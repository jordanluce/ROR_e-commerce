class Admin::ProductsController < Admin::BaseController

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
		@product.variants << variants_service.variants
	end

	def show
		@product = Product.find(params[:id])
	end

	def create
		@product = Product.new(strong_params)
		if @product.save
			redirect_to admin_products_path, notice: 'Your product was succesfully created'
		else
			flash[:alert] = 'There was a problem saving the product'
			render 'new'
		end
	end

	def edit
		@product = Product.find(params[:id])
		@product.variants << variants_service.missing_variants 
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(strong_params)
			redirect_to admin_products_path, notice: 'Product succesfully updated'
		else
			flash[:alert] = 'There was a problem updating the product'
			render 'edit'
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to admin_products_path
	end

	private

	def strong_params
		params.require(:product).permit(:name, :price, :description, :image, variants_attributes: [:id, :size_id, :inventory])
	end

	def variants_service
		@variants_service ||= VariantsService.new(@product)
	end

end