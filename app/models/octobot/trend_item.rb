module Octobot
  class TrendItem < Crawler
    def initialize(model, content, language)
      @language = language
      super(model, content)
    end

    def language_id
      @language.id
    end

    %i[title description language_selector].each do |method|
      define_method(method) do
        extract_value(__method__.to_s)
      end
    end

    %i[stars forks].each do |method|
      define_method(method) do
        extract_value(__method__.to_s) do |value|
          value.text.strip.delete(',').to_i
        end
      end
    end

    def link
      extract_value(__method__.to_s) do |value|
        'https://github.com' + value.attr('href').text.strip
      end
    end

    def stats
      extract_value(__method__.to_s) do |value|
        value.last.text.strip
      end
    end

    def checked
      false
    end

    def download_date
      Date.today
    end
  end
end
