module Foodbot
  class DealCrawler < Crawler
    def initialize(model, content, product, retailer)
      @product = product
      @retailer = retailer
      super(model, content)
    end

    def run
      deals = []
      super do |element|
        @field_html = element
        deals << Foodbot::Deal.find_or_create_by(build)
      end
      deals
    end

    private

    def product_id
      @product.id
    end

    def retailer_id
      @retailer.id
    end

    %i[description discount price_new price_old quantity date].each do |method|
      define_method(method) do
        extract_value(__method__.to_s)
      end
    end

    def image
      extract_value(__method__.to_s) do |value|
        value.attr('src').text
      end
    end
  end
end
