class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def setup
    @dishes = Dish.all
  end
  
  def order
    dish = Dish.find(params["order"]["dish_id"].to_i)
    user = current_user
    
    if params["order"]["id"].present?
      order=Order.find(params["order"]["id"].to_i)
      order.update_attributes(dish: dish)
    else
      order=Order.create!(user: user, dish: dish)
    end
   
    if order.valid? 
      flash[:notice] = 'Successfully order'
    else
      flash[:error] = "Order failed with error (#{order.errors.messages})"
    end
    redirect_to root_path
  end
  
  def dashboard
    @dishes = Dish.all.where(enable: true)
    @orders = Order.all.where("created_at > ?", 12.hours.ago)
    
    if !(@your_dish = @orders.find_by(user: current_user)).present?
      @your_dish = Order.new
    end
  end
  
  private
  
    def order_params
      params.require(:order).permit(:id, :dish_id)
    end
end
