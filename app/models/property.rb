class Property < ApplicationRecord
	belongs_to :users
	has_one :address, as: :owner
end
