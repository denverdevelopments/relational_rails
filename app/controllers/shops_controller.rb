class ShopsController < ApplicationController
  def index
    @shops = Shop.all.newest_first
  end

  def show
    @shop = Shop.find(params[:id])
    @count_candy = @shop.candies.count
  end

  def candies
    @shop = Shop.find(params[:id])
    @candies = @shop.candies
  end

  def new
  end

  def create
    shop = Shop.new({
      name: params[:name],
      sells_drinks: params[:sells_drinks],
      varieties: params[:varieties]
      })
    if shop.save
      redirect_to '/shops'
    else
      flash[:notice] = "Candy shop not created: Required information missing"
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    shop.update(shop_params)
    if shop.save
      redirect_to "/shops/#{shop.id}"
    else
      # render :edit
      redirect_to "/shops/#{shop.id}/edit"
      flash[:notice] = "Error: Required information missing"
    end
  end

  def destroy
    Shop.destroy(params[:id])
    redirect_to '/shops'
  end

  private

  def shop_params
    params.permit(:name, :sells_drinks, :varieties)
  end

end



#link_to "Edit Discount", "/merchants/#{@merchant.id}/discounts/#{@discount.id}/edit"
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
