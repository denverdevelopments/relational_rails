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

  def alpha
    @bakery = Bakery.find(params[:id])
    @pastries = @bakery.alphabetical_pastries
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
  end

    def edit
      @bakery = Bakery.find(params[:id])
    end

    def update
      bakery = Bakery.find(params[:id])
      bakery.update(bakery_params)
      if bakery.save
        redirect_to "/bakeries/#{bakery.id}"
      else
        flash.now[:error] = 'Bakery not updated: Missing required information'
        render :new
      end
    end

  private
    def bakery_params
      params.permit(:name, :open_on_weekends, :hours_open)
    end
end
