class Property < ApplicationRecord
	belongs_to :user
	has_one :address, as: :owner
	accepts_nested_attributes_for :address
end
