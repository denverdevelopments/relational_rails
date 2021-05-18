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

  def edit
    @candy = Candy.find(params[:id])
  end

  def update
    candy = Candy.find(params[:id])
    candy.update(candy_params)
    if candy.save
      redirect_to "/candies/#{candy.id}"
    else
      flash[:notice] = "Error: Required information missing"
    end
  end

  def destroy
    Candy.destroy(params[:id])
    redirect_to '/candies'
  end

  private

  def candy_params
    params.permit(:brand, :all_natural, :calories)
  end

end
