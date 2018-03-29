class CrawlerController < ApplicationController
  def index
    render json: {
      foodbot: Foodbot::Product.process_products,
      octobot: Octobot::Language.process_languages
    }
  end
end
