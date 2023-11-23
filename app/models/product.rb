class Product < ApplicationRecord
  CATEGORIES = %w[Console Game Service Accessory Part]

  belongs_to :user
  has_one_attached :photo

  validates :name, :price, :description, :quantity, :category, presence: true
  validates :price, presence: true

  validates :category, inclusion: { in: CATEGORIES }
  validates :description, length: { minimum: 10 }

  # after_create :sub_comma

  # def sub_comma
  #   self.price = self.price.to_s.gsub!('.', ',').to_f
  # end
end
