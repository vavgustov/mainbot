# == Schema Information
#
# Table name: foodbot_products
#
#  id     :integer          not null, primary key
#  title  :string(255)
#  active :boolean
#

module Foodbot
  class Product < ApplicationRecord
    include HasStatus

    validates :title, presence: true, uniqueness: true

    class << self
      def process_products
        products = {}
        active.each do |product|
          products[product.title] = Foodbot::Retailer.process_retailers(product)
        end
        products
      end
    end
  end
end
