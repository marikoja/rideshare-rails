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
    @trip = Trip.new
    @trip.passenger = Passenger.find_by(id: params[:passenger_id])
    @trip.driver = Driver.random_driver
    @trip.cost = rand(100..10000)
    @trip.date = Date.today
    # @trip.rating = 0

    if @trip.save
      redirect_to passenger_path(@trip.passenger)
    else
      render :edit
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
      if @trip.rating > 0
        redirect_to trip_path(@trip.passenger)
      else
        redirect_to trip_path(@trip)
      end
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
  return params.require(:trip).permit(:date, :cost, :passenger_id, :driver_id, :rating)
end
