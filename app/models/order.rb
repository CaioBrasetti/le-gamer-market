class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validate :check_disponibility
  validate :check_balance

  def check_disponibility
    return unless self.quantity
    
    errors.add(:quantity, "not enough in stock") if self.quantity > self.product.quantity
  end

  def check_balance
    errors.add(:quantity, "can't be bought with your balance") if self.price_transactions > self.user.balance
  end
end
