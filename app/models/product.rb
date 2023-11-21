class Product < ApplicationRecord
  CATEGORIES = %w[Console Game Service Accessory Part]

  belongs_to :user

  validates :name, :price, :description, :quantity, :category, presence: true
  validates :price, presence: true

  validates :category, inclusion: { in: CATEGORIES }
  validates :description, length: { minimum: 10 }
end
