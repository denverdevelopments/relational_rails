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

  def new
  end

  def create
    bakery = Bakery.new({
      name: params[:name],
      open_on_weekends: params[:open_on_weekends],
      hours_open: params[:hours_open]
      })
    if bakery.save
      redirect_to '/bakeries'
    else
      flash.now[:error] = 'Bakery not created: Missing required information'
      render :new
    end

    def edit
      @bakery = Bakery.find(params[:id])  
    end

  end
end
