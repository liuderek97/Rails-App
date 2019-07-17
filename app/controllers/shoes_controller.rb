class ShoesController < ApplicationController
  before_action :set_shoe, only: [:show, :edit, :update, :destroy, :buy]

  # GET /shoes
  # GET /shoes.json
  def index
    @shoes = Shoe.all
  end

  # GET /shoes/1
  # GET /shoes/1.json
  def show
  end

  # GET /shoes/new
  def new
    if user_signed_in?
      
      if current_user.profile
          @shoe = Shoe.new
          
      else
          redirect_to new_profile_path
      end
  else
      redirect_to new_user_session_path
  end
  end

  # GET /shoes/1/edit
  def edit
  end

  # POST /shoes
  # POST /shoes.json
  def create

    @shoe = Shoe.new(shoe_params)
    @shoe.seller_id = current_account.id


    
    

    respond_to do |format|
      if @shoe.save
        format.html { redirect_to @shoe, notice: 'Shoe was successfully created.' }
        format.json { render :show, status: :created, location: @shoe }
      else
        format.html { render :new }
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoes/1
  # PATCH/PUT /shoes/1.json
  def update
    if @shoe.pictures
      @shoe.pictures.purge
    end
    respond_to do |format|
      if @shoe.update(shoe_params)
        format.html { redirect_to @shoe, notice: 'Shoe was successfully updated.' }
        format.json { render :show, status: :ok, location: @shoe }
      else
        format.html { render :edit }
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoes/1
  # DELETE /shoes/1.json
  def destroy
    @shoe.destroy
    respond_to do |format|
      format.html { redirect_to shoes_url, notice: 'Shoe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def buy 
  @shoe.buyer_id = current_account.id
  @shoe.save
  redirect_to root_path, notice: 'Product Successfully purchased'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoe
      @shoe = Shoe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shoe_params
      params.require(:shoe).permit(:brand, :price, :release_date, :description, :size, :seller_id, pictures:[])
    end
end
