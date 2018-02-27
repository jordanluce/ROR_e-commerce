class Customer < ApplicationRecord
	has_secure_password

	has_many :orders

	def fullname
		"#{firstname} #{lastname}"
	end
end
