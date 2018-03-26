module Foodbot
  class DataController < BaseController
    def run
      render json: Product.process_products
    end
  end
end
