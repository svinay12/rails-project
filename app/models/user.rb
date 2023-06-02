class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  
  has_one :address, as: :owner
  has_many :lands, dependent: :destroy
  has_many :properties, dependent: :destroy

  has_many :builder_projects, class_name: 'Project', foreign_key: 'builder_id'
  has_many :client_projects, class_name: 'Project', foreign_key: 'client_id'

  validates :mobile, numericality: true
  validates :mobile, :name, :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ }
  validates :mobile, length: 10..15
  
end
