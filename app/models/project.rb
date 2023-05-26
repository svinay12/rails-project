class Project < ApplicationRecord

	has_many_attached :project_images
	
	has_one :address, as: :owner
	belongs_to :builder, class_name: 'User'
  	belongs_to :client, class_name: 'User'
  	accepts_nested_attributes_for :address, allow_destroy: true, update_only: true
end
