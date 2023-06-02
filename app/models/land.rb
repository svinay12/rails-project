class Land < ApplicationRecord
	has_many_attached :images
	belongs_to :users
	has_one :address, as: :owner, dependent: :destroy

  validates :price , :land_area, presence: true 
end
