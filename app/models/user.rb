class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :rooms
  
  has_many :reservations
  has_many :rooms, through: :reservations
  
  has_one_attached :avatar
  
end