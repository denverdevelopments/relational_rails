class PastriesController < ApplicationController
  def index
    # @pastries = ['Pastry 1', 'Pastry 2', 'Pastry 3']
    @pastries = Pastry.all
  end

  def show
    @pastry.find(params[:id])
  end
end
