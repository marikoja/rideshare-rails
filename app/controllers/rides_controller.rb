class RidesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    trip = Trip.new(trip_params)
    if trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end

end
