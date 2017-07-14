class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }
  validates_inclusion_of :quantity, :in => 1..100

  validates :product_id, presence: true
  validates :order_id, presence: true









end
