module HasDownloadDate
  extend ActiveSupport::Concern

  def download_date
    Date.today
  end
end
