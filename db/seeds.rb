# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

module Seed
  module Octobot
    class << self
      def run
        5.times do
          ::Octobot::Language.find_or_create_by build_language
        end
        10.times do |i|
          ::Octobot::Trend.find_or_create_by build_trend(i)
        end
      end

      private

      def build_trend(i)
        {
          language: ::Octobot::Language.send(%w[first second third fourth fifth].sample),
          title: "#{Faker::Hacker.adjective}_#{i}",
          description: Faker::Hacker.say_something_smart,
          language_selector: Faker::Hacker.adjective,
          link: Faker::Internet.url,
          stars: rand(20..200),
          forks: rand(5..50),
          stats: "#{rand(1..100)} downloads this week",
          checked: false,
          download_date: Date.today
        }
      end

      def build_language
        {
          title: Faker::Hacker.abbreviation,
          active: rand(0..1)
        }
      end
    end
  end
end

Seed::Octobot.run
