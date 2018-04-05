class Driver < ApplicationRecord
  has_many :trips

  def driver_rating
    total_ratings = 0
    number_of_trips = 0

    self.trips.each do |trip|
      if trip.rating != nil
        total_ratings += trip.rating
        number_of_trips += 1
      end
    end

    average_rating = (number_of_trips == 0 ? 0 : total_ratings/number_of_trips)
    return average_rating
  end

  def driver_earnings
    total_earnings = 0

    self.trips.each do |trip|
      if trip.rating != nil
        total_earnings += trip.cost
      end
    end

    total_earnings = total_earnings/100

    return total_earnings
  end

  def new_trip_data
    return Driver.all.sample
    # cost = rand(5..100)
  end
  def self.cost
    cost = rand(10..100)
    return cost
  end

end
