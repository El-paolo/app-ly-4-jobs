class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :applications
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum :role, ["normal_user", "admin"]
  validates :name, presence: true
  validates :phone, presence: true
  validates :password, presence: true
  
end
