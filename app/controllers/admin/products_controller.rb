class Admin::ProductsController < Admin::BaseController

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
		@product.variants << variants
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
		@product.variants << missing_variants if variant_changed?
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

	def variants
		@variant ||= Size.all.map {|size| Variant.new(size_id: size.id)}
	end

	def missing_variants_ids
		variants.map{|v| v.size_id} - @product.variants.map{|v| v.size_id}
	end

	def missing_variants
		missing_variants_ids.map{|id| Variant.new(size_id: id)}
	end

	def variant_changed?
		variants.size != @product.variants.size
	end

end