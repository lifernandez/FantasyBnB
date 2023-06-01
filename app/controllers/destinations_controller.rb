class DestinationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @destinations = Destination.order(id: :asc)
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.user = current_user
    if @destination.save
      redirect_to @destination, notice: 'Destination was successfully created.'
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
    @destination = Destination.find(params[:id])
  end

  private

  def destination_params
    params.require(:destination).permit(:title, :address, :price, :description, photos: [])
  end

end
