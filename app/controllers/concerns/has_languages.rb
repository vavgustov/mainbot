module HasLanguages
  extend ActiveSupport::Concern

  private

  def set_languages
    @languages = Octobot::Language.all
  end
end