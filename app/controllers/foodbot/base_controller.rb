module Foodbot
  class BaseController < ApplicationController
    before_action :set_foodbot_navbar

    private

    def set_foodbot_navbar
      @navbar_items = [
        {
          title: 'Deals',
          path: foodbot_root_path
        },
        {
          title: 'Products',
          path: foodbot_products_path
        },
        {
          title: 'Retailers',
          path: foodbot_retailers_path
        }
      ]
    end
  end
end
