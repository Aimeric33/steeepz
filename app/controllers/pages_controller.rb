class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_pages_controller

  def home
  end

  private

  def set_pages_controller
    @pages_controller = true
  end
end
