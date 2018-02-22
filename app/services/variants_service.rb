class VariantsService

	def initialize(product)
		@product = product
	end

	def variants
		@variant ||= Size.all.map {|size| Variant.new(size_id: size.id)}
	end

	def missing_variants
	 variant_changed? ? missing_variants_ids.map{|id| Variant.new(size_id: id)} : []
	end

	private

	def missing_variants_ids
		variants.map{|v| v.size_id} - @product.variants.map{|v| v.size_id}
	end

	def variant_changed?
		variants.size != @product.variants.size
	end

end