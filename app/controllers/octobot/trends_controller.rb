module Octobot
  class TrendsController < TrendsBaseController
    def index
      @trends = @trends.decorate
    end
  end
end
