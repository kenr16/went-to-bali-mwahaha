#Class order is the total order in the cart.
class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user, optional: true

  before_save :calculate_total


  # This calculates the total of all items in the basket.
  def calculate_total
    self.total_price = order_items.collect { |item| item.product.price * item.quantity }.sum
  end

  #
  def finalize(user)
    self.user_id = user.id
    self.status = 2
    self.save
  end


end
