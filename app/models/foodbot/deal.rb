# == Schema Information
#
# Table name: foodbot_deals
#
#  id            :integer          not null, primary key
#  product_id    :integer
#  retailer_id   :integer
#  description   :string(255)
#  image         :string(255)
#  discount      :string(255)
#  price_new     :string(255)
#  price_old     :string(255)
#  quantity      :string(255)
#  date          :string(255)
#  download_date :date
#

module Foodbot
  class Deal < ApplicationRecord
    belongs_to :retailer, class_name: 'Foodbot::Retailer'
    belongs_to :product, class_name: 'Foodbot::Product'

    scope :latest, -> { includes(:product, :retailer).where(download_date: maximum(:download_date)) }
  end
end
