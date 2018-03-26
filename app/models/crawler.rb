class Crawler
  def initialize(model, content)
    @model = model
    @content = content
    @selectors = YAML.load(File.read(selectors_path))
  end

  def build
    item = {}
    @model.column_names.map(&:to_sym).each do |method|
      next unless respond_to?(method)
      item[method] = send(method)
    end
    item
  end

  private

  def extract_value(selector)
    value = @content.css(@selectors[selector])
    return yield value if block_given?
    value.text.strip
  end

  def selectors_path
    Rails.root.join('config', "selectors/#{selectors_name}.yml")
  end

  def selectors_name
    @model.name.split('::').first.downcase
  end
end
