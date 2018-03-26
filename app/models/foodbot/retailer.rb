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
      html = results_html(product)
      html.css('.b-offer').each do |offer|
        results << Deal.save_offer(offer, selectors, product, self)
      end
      results
    end

    private

    def build_product_url(product)
      product_url = ENV['URL_TEMPLATE'].dup
      product_url.sub!(':location', ENV['LOCATION'])
      product_url.sub!(':params', { q: product.title, retailer: url }.to_param)

      # dd product_url
    end

    def results_html(product)
      browser = Capybara.current_session
      browser.visit build_product_url(product)
      Nokogiri::HTML(browser.body)
    end
  end
end
