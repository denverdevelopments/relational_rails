class PastriesController < ApplicationController
  def index
    @pastries = Pastry.all
  end

  def show
    @pastry = Pastry.find(params[:id])
  end
end
