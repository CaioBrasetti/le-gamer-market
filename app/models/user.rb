class User < ApplicationRecord
  has_many :products
  has_many :orders
  validates :last_name, :first_name, presence: true
  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
