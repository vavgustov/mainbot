module Foodbot
  class DealsController < BaseController
    include DealsList
    include HasProducts

    before_action :set_products
    before_action :set_all_deals

    def index
      @deals = @deals_all
    end
  end
end
