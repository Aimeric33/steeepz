class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :show_navbar

  def home
  end

  private

  def show_navbar
    @show_navbar = true
  end
end
