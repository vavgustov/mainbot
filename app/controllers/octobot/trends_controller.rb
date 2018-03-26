module Octobot
  class TrendsController < BaseController
    before_action :set_trends

    def index; end

    def mark
      @trends.update_all(checked: true)
      flash[:success] = 'Marked as checked!'
      redirect_to octobot_root_path
    end

    private

    def set_trends
      @trends = Trend.includes(:language).where(checked: false).decorate
    end
  end
end
