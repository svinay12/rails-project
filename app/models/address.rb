class Address < ApplicationRecord
	belongs_to :owner , polymorphic: true
end
