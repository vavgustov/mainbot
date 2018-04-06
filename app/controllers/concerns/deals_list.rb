module DealsList
  extend ActiveSupport::Concern

  private

  def set_all_deals
    @deals_all = Foodbot::Deal.current
  end
end
