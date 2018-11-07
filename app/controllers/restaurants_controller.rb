class RestaurantsController < ApplicationController


  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end
  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    end
end




  # # DELETE /restaurants/1
  # # DELETE /restaurants/1.json
  # def destroy
  #   @restaurant.destroy
  #   respond_to do |format|
  #     format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_restaurant
  #     @restaurant = Restaurant.find(params[:id])
  #   end
