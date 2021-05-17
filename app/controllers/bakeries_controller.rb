class BakeriesController < ApplicationController
  def index
    @bakeries = Bakery.all
  end

  def show
    @bakery = Bakery.find(params[:id])
    @pastry_amount = @bakery.pastries.count
  end

  def pastries
    @bakery = Bakery.find(params[:id])
    @pastries = @bakery.pastries
  end
end
