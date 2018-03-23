module Swarm
  module Browser
    class << self
      def download(url, js: true)
        page = nil
        5.times do
          response = js ? process_with_js(url) : process_without_js(url)
          unless response.status == 200
            sleep 5
            next
          end
          page = response.body
          break
        end
        raise Octobot::SpiderDownloadFailure if page.nil?
        page
      end

      private

      def process_with_js(url)
        Capybara.current_session.visit url
      end

      def process_without_js(url)
        Faraday.get url
      end
    end
  end
end
