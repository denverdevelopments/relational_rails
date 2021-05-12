class BakeriesController < ApplicationController
  def index
    @bakeries = ['Bakery 1', 'Bakery 2', 'Bakery 3']
    # @bakeries = Bakery.all
  end

  def show
    @bakery.find(params[:id])
  end
end
