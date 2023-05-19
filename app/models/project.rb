class Project < ApplicationRecord
	has_one :address, as: :owner
	belongs_to :users
	belongs_to :builder, class_name: 'User'
  	belongs_to :client, class_name: 'User'
end
