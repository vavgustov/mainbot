module Foodbot
  class Deal < ApplicationRecord
    belongs_to :retailer, class_name: Foodbot::Retailer
    belongs_to :product, class_name: Foodbot::Product

    scope :latest, -> { includes(:product, :retailer).where(download_date: maximum(:download_date)) }

    class << self
      def save_offer(offer, selectors, product, retailer)
        deal = {}
        selectors.each do |type, selector|
          deal[type.to_sym] = type == 'image' ? process_image(offer, selector) : offer.css(selector).text
        end
        deal[:product] = product
        deal[:retailer] = retailer
        deal[:download_date] = Date.today
        find_or_create_by(deal)
      end

      private

      def process_image(offer, selector)
        style = offer.css(selector).attr('style')
        return '' if style.nil?
        content = style.content.split('url(').last.split(')').first
        content.delete! '\"'
        content.delete! '\''
        content
      end
    end
  end
end
