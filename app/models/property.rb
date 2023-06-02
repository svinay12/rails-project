 class Property < ApplicationRecord
	
	has_many_attached :property_images, dependent: :destroy

	belongs_to :user
	has_one :address, as: :owner , dependent: :destroy
	accepts_nested_attributes_for :address, allow_destroy: true, update_only: true
  	validates :price, :land_area, :property_type, :floor, presence: true
end
