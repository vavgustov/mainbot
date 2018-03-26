module Foodbot
  class DealsController < BaseController
    def index
      @deals = Deal.latest
    end
  end
end
