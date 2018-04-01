module Foodbot
  class DealsController < BaseController
    include HasProducts

    before_action :set_products

    def index
      @deals = Deal.includes(:retailer).latest
    end
  end
end
