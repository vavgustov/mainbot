module HasProducts
  extend ActiveSupport::Concern

  private

  def set_products
    products_ids = Foodbot::Deal.latest.uniq(&:product_id).pluck(:product_id)
    @products = Foodbot::Product.find(products_ids)
  end
end