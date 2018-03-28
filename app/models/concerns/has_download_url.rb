module HasDownloadUrl
  extend ActiveSupport::Concern

  class_methods do
    def download_url(params)
      bot_name = name.split('::').first.downcase
      url_settings = YAML.load(File.read(url_settings_path(bot_name)))
      send("#{bot_name}_url", url_settings, params)
    end

    private

    def url_settings_path(bot_name)
      Rails.root.join('config', "swarm/#{bot_name}/url.yml")
    end

    def octobot_url(url_settings, params)
      url = url_settings['pattern'].sub(':params', {
        since: url_settings['since']
      }.to_param)
      url.sub!(':language', params[:language])
    end

    def foodbot_url(url_settings, params)
      url = url_settings['pattern'].sub(':params', {
        q: params[:q],
        retailer: params[:retailer]
      }.to_param)
      url.sub!(':location', url_settings['location'])
    end
  end
end
