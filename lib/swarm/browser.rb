module Swarm
  module Browser
    class << self
      def download(url, js: true)
        page = nil
        5.times do
          response = js ? process_with_js(url) : process_without_js(url)
          status = response.try(:status) == 200 || response.try(:status_code) == 200
          unless status
            sleep 5
            next
          end
          page = response.body
          break
        end
        raise Swarm::SpiderDownloadFailure, url if page.nil?
        page
      end

      private

      def process_with_js(url)
        browser = Capybara.current_session
        browser.visit url
        browser
      end

      def process_without_js(url)
        Faraday.get url
      end
    end
  end
end
