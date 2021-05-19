class PastriesController < ApplicationController
  def index
    @pastries = Pastry.all
  end

  def show
    @pastry = Pastry.find(params[:id])
  end

  def new
    @bakery = Bakery.find(params[:id])
  end

  def create
    @bakery = Bakery.find(params[:id])
    pastry = @bakery.pastries.new({
      name: params[:name],
      savory_pastry: params[:savory_pastry],
      calories: params[:calories]
      })
    if pastry.save
      redirect_to "/bakeries/#{@bakery.id}/pastries"
    else
      flash.now[:error] = 'Pastry not created: Missing required information'
      render :new
    end
  end

  def edit
    @pastry = Pastry.find(params[:id])
  end

  def update
    pastry = Pastry.find(params[:id])
    pastry.update(pastry_params)
    if pastry.save
      redirect_to "/pastries/#{pastry.id}"
    else
      flash.now[:error] = 'Pastry not updated: Missing required information'
      render :new
    end
  end

  private
    def pastry_params
      params.permit(:name, :savory_pastry, :calories)
    end
end
