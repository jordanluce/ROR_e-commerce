# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
	name: 'kingsley ijomah',
	email: 'kingsley@test.com',
	password: 'kingsley'
	)

20.times do |i|
Customer.create(
	firstname: "john-#{i}",
	lastname: "doe-#{i}",
	email: "john.doe#{i}@test.com",
	address: 'Ascot',
	password: 'doe'
	)
end

%w(Small Medium Large).each do |size|
	Size.create(
		name: size
		)
end

shirts = %w(red blue green)

20.times do |i|
	Product.create(
		name: "shirt-#{i}",
		description: "Product description",
		price: [*20..300].sample,
		image: File.new("#{Rails.root}/public/seed-images/#{shirts.sample}.jpeg")
		)
end

Product.all.each do |product|
	Size.all.each do |size|
		Variant.create(
			product: product,
			size: size,
			inventory: 5
			)
	end
end

Customer.all.each do |customer|
	Order.create(
		customer: customer,
		product: Product.all.sample,
		size: Size.all.sample,
		quantity: 2,
		total: [*200..900].sample
		)
end