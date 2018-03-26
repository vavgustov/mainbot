module Octobot
  class Trend < ApplicationRecord
    belongs_to :language, class_name: Octobot::Language

    class << self
      def process_trends
        # TODO: move manual env to database
        ENV['DAY'] = 'monday'
        ENV['SINCE'] = 'weekly'
        trends = {}
        return trends unless ENV['DAY'] == Date.today.strftime('%A').downcase
        languages = Language.active
        languages.each do |language|
          trends[language.title.downcase] = process_language(language)
        end
        trends
      end

      private

      # TODO: extract this
      def build_url(language)
        page_url = 'https://github.com/trending:language?since=:since'
        page_url.sub!(':since', ENV['SINCE'])
        language.title == 'all' ? page_url.sub!(':language', '') : page_url.sub!(':language', "/#{language.title.downcase}")
        page_url
      end

      def process_language(language)
        trend_items = []
        # html = Nokogiri::HTML(Swarm::Browser.download(build_url(language), js: false))
        html = Nokogiri::HTML(File.open(Rails.root.join('public', 'pages/github.html')))
        html.css('.repo-list li').each do |repo|
          trend = Octobot::TrendItem.new(self, repo, language).build
          next unless Trend.where(title: trend[:title]).count.zero?
          trend_items << find_or_create_by(trend)
        end
        trend_items
      end
    end
  end
end