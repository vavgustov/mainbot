module Octobot
  class TrendsBaseController < BaseController
    before_action :set_trends

    private

    def set_trends
      @trends = Trend.includes(:language).active
    end
  end
end
