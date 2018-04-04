class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    id = params[:id]
    @trip = Trip.find(id)
  end

  def new
    @trip = Trip.new
  end

  def create
    trip = Trip.new(passenger:passenger_id, driver: Driver.ids.sample, cost:rand(100..15000), rating: 0, date: Date.today)
  
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
    id = params[:id]
    @trip = Trip.find(id)
    if @trip
      @trip.destroy
    end
    redirect_to trips_path
  end

private
  def trip_params
    return params.require(:trip).permit(:trip_id)
  end

end
