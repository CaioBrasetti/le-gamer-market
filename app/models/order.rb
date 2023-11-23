class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validate :check_disponibility
  validate :check_balance

  def check_disponibility
    errors.add(:quantity, "Não existe produto o suficiente") if self.quantity > self.product.quantity
  end

  def check_balance
    errors.add(:base, "Você não tem saldo o suficiente") if self.price_transactions > self.user.balance
  end
end
