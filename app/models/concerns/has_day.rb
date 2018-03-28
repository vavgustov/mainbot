module HasDay
  extend ActiveSupport::Concern

  included do
    scope :today, -> { where(day: Date.today.strftime("%A").downcase) }
  end
end
