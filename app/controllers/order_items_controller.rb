class OrderItemsController < ApplicationController

  def create
    @user = current_user
    @order = current_order
    @order.user_id = @user.id
    @order.save
    product_id = item_params[:product_id]
    @item = @order.order_items.find {|item| item.product_id.to_i == product_id.to_i}
    if @item
      @item.update_attributes(quantity: (@item.quantity + item_params[:quantity].to_i))
    else
      @item = @order.order_items.create!(item_params)
    end
    session[:order_id] = @order.id
    respond_to do |format|
      format.html { redirect_to products_url }
      format.js
    end
  end

  def update
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.update_attributes(item_params)
    @order.save
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    @order_items = current_order.order_items
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.js
    end
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
