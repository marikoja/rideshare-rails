class Driver < ApplicationRecord
  has_many :trips

  def self.driver_rating
    total_ratings = 0
    number_of_trips = 0

    Driver.trips.all.each do |trip|
      total_ratings += trip.rating
      number_of_trips += 1
    end

    average_rating = (number_of_trips == 0 ? 0 : total_ratings/number_of_trips)
    return average_rating
  end

  def self.driver_earnings
    total_earnings = 0

    Driver.trips.all.each do |trip|
      total_earnings += trip.cost
    end

    total_earnings = total_earnings/100

    return total_earnings
  end

  def self.random_driver
    return Driver.all.sample
  end

end
