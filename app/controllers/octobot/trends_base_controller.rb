module Octobot
  class TrendsBaseController < ApplicationController
    before_action :set_trends

    private

    def set_trends
      @trends = Trend.includes(:language).where(checked: false)
    end
  end
end
