class ProductsController < ApplicationController
  before_action :set_shop
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = @shop.products.order(created_at: :desc)
  end

  def show; end

  def new
    @product = @shop.products.new
  end

  def edit; end

  def create
    @product = @shop.products.new(product_params)
    if @product.save
      redirect_to [@shop, @product], notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to [@shop, @product], notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to shop_products_path(@shop), alert: "Product was successfully destroyed."
  end

  private
  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  # 親スコープ経由で取得（URL改ざん防止）
  def set_product
    @product = @shop.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :price_cents, :description, :stock)
  end
end
