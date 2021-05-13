class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end
end


# <p>&emsp;<%= link_to "Edit Discount", "/merchants/#{@merchant.id}/discounts/#{@discount.id}/edit" %></p>
# class TasksController < ApplicationController
#   def index #     @tasks = Task.all
#
#   def show  #     @task = Task.find(params[:id])
#
#   def new
#
#   def create
#     task = Task.new({
#       title: params[:task][:title],
#       description: params[:task][:description]
#       })
#     task.save
#     redirect_to '/tasks'
#   end
#
#   def edit  #     @task = Task.find(params[:id])
#
#   def update
#     task = Task.find(params[:id])
#     task.update({
#       title: params[:task][:title],
#       description: params[:task][:description]
#       })
#     task.save
#     redirect_to "/tasks/#{task.id}"
#   end
#
#   def destroy
#     Task.destroy(params[:id])
#     redirect_to '/tasks'
#   end
# end
