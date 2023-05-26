class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  
  has_one :address, as: :owner
  has_many :lands
  has_many :properties

  has_many :builder_projects, class_name: 'Project', foreign_key: 'builder_id'
  has_many :client_projects, class_name: 'Project', foreign_key: 'client_id'
end
