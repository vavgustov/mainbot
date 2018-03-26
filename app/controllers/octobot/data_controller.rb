module Octobot
  class DataController < BaseController
    def run
      render json: Trend.process_trends
    end
  end
end
