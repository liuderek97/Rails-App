class BuyerController < ApplicationController
  def page
    @shoe = Shoe.find(params[:shoe_id])
    @seller = Seller.find(params[:seller_id])
  end

  def payment
      # update the cars table with buyers id
      # update the join table with seller and buyer id
      # buyers id  - current_user.profile.buyer
      # seller id - @car.seller_id
      # car -  params[:car_id]

      
      # @buyer = current_user.profile.buyer
      # @car = Car.find(params[:car_id])
      # @seller = @car.seller
      # @buyer.cars << @buyer
      # @buyer.sellers << @seller

    @buyer = Buyer.find_by(profile_id: current_user.profile.id)

    @shoe = Shoe.find(params[:shoe_id])
    
    @buyer.shoes << @shoe

    @seller = Seller.find(params[:seller_id])
    @buyer.sellers <<  @seller
  
    # car_path(@car.id)
      redirect_to @shoe, notice: "payment made successfully"
  end
end