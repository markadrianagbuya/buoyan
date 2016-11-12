class DashboardController < ApplicationController
  def index
    @workshops = Workshop.order(held_on: :desc)
  end
end
