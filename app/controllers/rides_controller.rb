class RidesController < ApplicationController
  def index
    @trip = Trip.all
  end

  def show
    id = params[:id]
    @trip = Trip.find(id)
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
    @trip = Trip.find_by(id:params[:id])
    if !@trip.nil?
      if @trip.update(trip_params)
        redirect_to trip_path(@trip.id)
      else
        render :edit
      end
    else
      redirect_to trips_path
    end
  end

  def destroy
  end
end
