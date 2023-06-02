class Address < ApplicationRecord
  belongs_to :owner , polymorphic: true
  validates :plot_no, :locality, :city, :state, :zipcode, presence: true 
end
