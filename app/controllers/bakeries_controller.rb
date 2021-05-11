class BakeriesController < ApplicationController
  def index
    @bakeries = ['Bakery 1', 'Bakery 2', 'Bakery 3']
  end
end
