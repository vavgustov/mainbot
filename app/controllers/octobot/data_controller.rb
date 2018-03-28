module Octobot
  class DataController < BaseController
    def run
      render json: Language.process_languages
    end
  end
end
