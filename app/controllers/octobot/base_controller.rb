module Octobot
  class BaseController < ApplicationController
    before_action :set_octobot_navbar

    private

    def set_octobot_navbar
      @navbar_items = [
        {
          title: 'Trends',
          path: octobot_root_path,
        },
        {
          title: 'Languages',
          path: octobot_languages_path,
        }
      ]
    end
  end
end
