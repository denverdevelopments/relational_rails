class CandiesController < ApplicationController
  def index
    @candies = Candy.all
  end

  def show
    @candy = Candy.find(params[:id])
  end

  def new
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.find(params[:id])
    candy = @shop.candies.new({
      brand: params[:brand],
      all_natural: params[:all_natural],
      calories: params[:calories]
      })
    if candy.save
      redirect_to "/shops/#{@shop.id}/candies"
    else
      flash[:notice] = "Candy not created: Required information missing"
      render :new
    end
  end
end
