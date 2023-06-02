class Project < ApplicationRecord

	has_many_attached :project_images
	
	has_one :address, as: :owner, dependent: :destroy
	belongs_to :builder, class_name: 'User'
  	belongs_to :client, class_name: 'User'
  	accepts_nested_attributes_for :address, allow_destroy: true, update_only: true
  	validates :details, :builder_id, :generated_by , presence: true
  	validates :details, :builder_id, :generated_by , presence: true
  	
end
