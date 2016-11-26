class HomeController < ApplicationController
  def index
    @services = Service.all
    @sales = Sale.all
  end
end
