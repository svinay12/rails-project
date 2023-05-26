class Land < ApplicationRecord
	has_many_attached :images
	belongs_to :users
	has_one :address, as: :owner
end
