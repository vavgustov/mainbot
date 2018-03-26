module Octobot
  class TrendDecorator < Draper::Decorator
    delegate_all

    def github_language
      return 'Unknown' if object.language_selector.blank?
      object.language_selector
    end
  end
end
