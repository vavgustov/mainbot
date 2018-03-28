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
    belongs_to :language, class_name: 'Octobot::Language'
  end
end
