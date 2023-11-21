class Product < ApplicationRecord
  belongs_to :user
  validates :name, :price, :description, :quantity, :category, presence: true
  validates :price, presence: true

  validates :category, inclusion: { in: %w[console game service accessory part] }
  validates :description, length: { minimum: 10 }
end
