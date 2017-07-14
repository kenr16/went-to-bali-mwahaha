class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :admin
  helper_method :current_order
  helper_method :current_order_quantity

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin
    current_user && current_user.admin
  end

  def current_order
    session[:order_id] ? Order.find(session[:order_id]) : Order.new
  end

  def authorize_admin
    if !current_user || current_user.admin == false
      flash[:alert] = "You aren't authorized to visit that page.  This requires an administrator account."
      redirect_to '/sign_in'
    end
  end

  def authorize_user
    if !current_user
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to '/sign_up'
    end
  end

  def current_order_quantity
    quantity = 0
    current_order.order_items.each do |item|
      quantity += item.quantity
    end
    return quantity
  end





end
