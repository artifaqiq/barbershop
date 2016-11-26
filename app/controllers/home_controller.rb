class HomeController < ApplicationController
  layout 'home'

  def index
    @services = Service.all
    @sales = Sale.all
  end
end
