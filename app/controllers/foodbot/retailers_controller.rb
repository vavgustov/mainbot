module Foodbot
  class RetailersController < BaseController
    before_action :set_retailer, only: [:show, :edit, :update, :destroy]

    def index
      @retailers = Retailer.all
    end

    def show; end

    def new
      @retailer = Retailer.new(active: true)
    end

    def edit; end

    def create
      @retailer = Retailer.new(retailer_params)

      if @retailer.save
        redirect_to @retailer, notice: 'Retailer was successfully created.'
      else
        render :new
      end
    end

    def update
      if @retailer.update(retailer_params)
        redirect_to @retailer, notice: 'Retailer was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @retailer.destroy
      redirect_to foodbot_retailers_url, notice: 'Retailer was successfully destroyed.'
    end

    private

    def set_retailer
      @retailer = Retailer.find(params[:id])
    end

    def retailer_params
      params.require(:foodbot_retailer).permit(:title, :day, :url, :active)
    end
  end
end
