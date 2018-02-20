class Size < ApplicationRecord
	validates :name, presence: :true, uniqueness: :true

	has_many :variants
end
