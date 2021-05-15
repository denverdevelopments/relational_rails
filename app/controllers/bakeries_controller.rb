class BakeriesController < ApplicationController
  def index
    @bakeries = Bakery.all
  end

  def show
    @bakery = Bakery.find(params[:id])
  end

  def pastries
    @bakery = Bakery.find(params[:id])
    @pastries = @bakery.pastries
    require "pry";binding.pry
  end
end
