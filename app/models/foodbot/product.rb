module Foodbot
  class Product < ApplicationRecord
    include Statusable

    validates :title, presence: true, uniqueness: true

    class << self
      def process_products
        deals = []
        retailers = Foodbot::Retailer.today.active
        active.each do |product|
          retailers.each do |retailer|
            deals << retailer.scan(product)
          end
        end
        deals
      end
    end
  end
end
