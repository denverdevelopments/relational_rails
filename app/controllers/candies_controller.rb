class CandiesController < ApplicationController
  def index
    @candies = Candy.all
  end

  def show
    @candy = Candy.find(params[:id])
  end
end
