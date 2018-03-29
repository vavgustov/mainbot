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

    class << self
      def process_retailers(product)
        retailers = {}
        today.active.each do |retailer|
          retailers[retailer.title] = Foodbot::Deal.process_deals(product, retailer)
        end
        retailers
      end
    end
  end
end
