module Octobot
  class TrendStatusesController < TrendsBaseController
    def update
      @trends.update_all(active: false)
      flash[:success] = 'Marked as checked!'
      redirect_to octobot_root_path
    end
  end
end
