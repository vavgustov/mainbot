module Foodbot
  class Retailer < ApplicationRecord
    include Statusable

    scope :today, -> { where(day: Date.today.strftime("%A").downcase) }

    validates :title, presence: true, uniqueness: true
    validates :day, presence: true, inclusion: { in: Date::DAYNAMES.map(&:downcase) }

    def scan(product)
      # TODO: extract this
      ENV['URL_TEMPLATE'] = 'https://edadeal.ru/:location/offers?:params'
      ENV['LOCATION'] = 'sankt-peterburg'

      results = []
      selectors = YAML.load_file(Rails.root.join('config', 'selectors/foodbot.yml'))
      html = Nokogiri::HTML(Swarm::Browser.download(build_product_url(product), js: true))
      html.css('.b-offer').each do |offer|
        results << Deal.save_offer(offer, selectors, product, self)
      end
      results
    end

    private

    # TODO: extract this
    def build_product_url(product)
      product_url = ENV['URL_TEMPLATE'].dup
      product_url.sub!(':location', ENV['LOCATION'])
      product_url.sub!(':params', { q: product.title, retailer: url }.to_param)
    end
  end
end
