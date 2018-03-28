class Crawler
  include HasDownloadDate

  def initialize(model, content)
    @model = model
    @content = content
    @selectors = YAML.load(File.read(selectors_path))
    @field_html = ''
  end

  def build
    item = {}
    @model.column_names.map(&:to_sym).each do |method|
      next unless respond_to?(method)
      item[method] = send(method)
    end
    item
  end

  def run
    @content.css(@selectors['wrapper']).each do |element|
      yield element
    end
  end

  private

  def extract_value(selector)
    value = @field_html.css(@selectors['item'][selector])
    return yield value if block_given?
    value.text.strip
  end

  def selectors_path
    Rails.root.join('config', "swarm/#{bot_name}/selectors.yml")
  end

  def bot_name
    @model.name.split('::').first.downcase
  end
end
