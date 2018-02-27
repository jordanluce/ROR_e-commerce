class Customer < ApplicationRecord
	has_secure_password

	def fullname
		"#{firstname} #{lastname}"
	end
end
