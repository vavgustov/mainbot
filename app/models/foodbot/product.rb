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

    #  should be product:retailer:deal


    class << self
      def process_products
        deals = {}
        retailers = Foodbot::Retailer.today.active
        active.each do |product|
          retailers.each do |retailer|
            deals[] << retailer.scan(product)
          end
        end
        deals
      end
    end
  end
end
