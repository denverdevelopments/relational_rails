class PastriesController < ApplicationController
  def index
    @pastries = Pastry.all
  end

  def show
    @pastry = Pastry.find(params[:id])
  end

  def new
    @pastry = Pastry.new
  end

  def create
    @pastry = Pastry.new({
      name: params[:name],
      savory_pastry: params[:savory_pastry],
      calories: params[:calories]
      })
    if @pastry.save
      redirect_to '/pastries'
    else flash.now[:error] = 'Pastry not created: Missing required information'
      render :new
    end
  end
end
