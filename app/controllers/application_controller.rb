class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_navbar_items

  private

  def set_navbar_items
    @navbar_items = []
  end
end
