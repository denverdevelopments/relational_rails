class BakeriesController < ApplicationController
  def index
    @bakeries = Bakery.all
  end

  def show
    @bakery = Bakery.find(params[:id])
  end
end
