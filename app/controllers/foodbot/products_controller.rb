module Foodbot
  class ProductsController < BaseController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
      @products = Product.all
    end

    def show; end

    def new
      @product = Product.new
    end

    def edit; end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to @product, notice: 'Product type was successfully created.'
      else
        render :new
      end
    end

    def update
      if @product.update(product_params)
        redirect_to @product, notice: 'Product type was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @product.destroy
      redirect_to products_url, notice: 'Product type was successfully destroyed.'
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:foodbot_product).permit(:title, :active)
    end
  end
end
