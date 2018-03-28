# == Schema Information
#
# Table name: foodbot_retailers
#
#  id     :integer          not null, primary key
#  title  :string(255)
#  url    :string(255)
#  day    :string(255)
#  active :boolean
#

module Foodbot
  class Retailer < ApplicationRecord
    include HasStatus
    include HasDay

    validates :title, presence: true, uniqueness: true
    validates :day, presence: true, inclusion: { in: Date::DAYNAMES.map(&:downcase) }

    def scan(product)
      # html = Nokogiri::HTML(Swarm::Browser.download(build_product_url(product), js: true))
      html = Nokogiri::HTML(File.open(Rails.root.join('public', 'pages/foodbot.html')))
      crawler = Foodbot::DealCrawler.new(Foodbot::Deal, html, product, self)
      crawler.run
    end
  end
end
