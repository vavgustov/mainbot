module Octobot
  class TrendsController < TrendsBaseController
    include HasLanguages

    before_action :set_languages

    def index
      @trends = @trends.decorate
    end
  end
end
