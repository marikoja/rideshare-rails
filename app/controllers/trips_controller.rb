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
    @trip.passenger = Passenger.find(params[:id])
    @trip.passenger_id = params[:passenger_id]
  end

  def create

    passenger_id = Passenger.find_by(id: params[:passenger_id])
    driver_id = Driver.random_driver
    cost = rand(10..500)
    date=Date.today
    rating = 0
    @trip = Trip.new(trip_params)
    
    if @trip.save
      redirect_to trips_path
    else
      render :show
    end
  end

  def show
    id = params[:id]
    @trip = Trip.find(id)
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    trip_updates = params[:trip]
    @trip = Trip.find(params[:id])

    @trip.rating = trip_updates[:rating]

    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :edit
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
end

private
def trip_params
  return params.permit(:date,:cost,:passenger_id,:driver_id,:rating)
end
