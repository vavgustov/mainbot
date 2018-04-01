module Foodbot
  class DealsController < BaseController
    include HasProducts

    before_action :set_products

    def index
      @deals = Deal.latest
    end
  end
end
