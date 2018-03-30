# == Schema Information
#
# Table name: octobot_trends
#
#  id                :integer          not null, primary key
#  language_id       :integer
#  title             :string(255)
#  description       :text(65535)
#  language_selector :string(255)
#  link              :string(255)
#  stars             :integer
#  forks             :integer
#  stats             :string(255)
#  checked           :boolean
#  download_date     :date
#

module Octobot
  class Trend < ApplicationRecord
    include HasDownloadUrl

    belongs_to :language, class_name: 'Octobot::Language'

    class << self
      def process_trends(language)
        link = download_url(language: language.title.downcase)
        html = Nokogiri::HTML(BotBrowser.download(link, js: false))
        # html = Nokogiri::HTML(File.open(Rails.root.join('public', 'pages/octobot.html')))
        crawler = Octobot::TrendCrawler.new(Octobot::Trend, html, language)
        crawler.run
      end
    end
  end
end
