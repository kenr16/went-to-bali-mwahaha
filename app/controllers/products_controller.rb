class ProductsController < ApplicationController
  before_filter :authorize_admin, except: [:index, :show, :home]

  def home
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html { redirect_to products_url }
      format.js
    end
  end

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    respond_to do |format|
      format.html { redirect_to products_url }
      format.js
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "The product was successfully added!"
      redirect_to '/'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product was successfully edited!"
      redirect_to '/'
    else
      flash[:alert] = "Product edit failed!"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product successfully deleted!"
    redirect_to '/'
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
