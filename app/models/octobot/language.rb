# == Schema Information
#
# Table name: octobot_languages
#
#  id     :integer          not null, primary key
#  title  :string(255)
#  active :boolean
#

module Octobot
  class Language < ApplicationRecord
    include HasStatus
    include HasDownloadUrl

    class << self
      def process_languages
        trends = {}
        return trends unless should_run?
        languages = Language.active
        languages.each do |language|
          trends[language.title.downcase] = process_language(language)
        end
        trends
      end

      private

      def should_run?
        settings = YAML.load(File.read(settings_path))
        return false unless settings['day'] == Date.today.strftime('%A').downcase
        true
      end

      def settings_path
        Rails.root.join('config', 'swarm/octobot/settings.yml')
      end

      def process_language(language)
        link = download_url(language: language.title.downcase)
        # html = Nokogiri::HTML(Swarm::Browser.download(link, js: false))
        html = Nokogiri::HTML(File.open(Rails.root.join('public', 'pages/octobot.html')))
        crawler = Octobot::TrendCrawler.new(Octobot::Trend, html, language)
        crawler.run
      end
    end
  end
end
