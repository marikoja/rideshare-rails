class Driver < ApplicationRecord
  has_many :trips

    validates :name, presence: true, uniqueness: {message: "Driver already exists"}
    validates :vin, presence: true, uniqueness: {message: "Vin already exists"}

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

  def self.random_driver
    return Driver.all.sample
  end

  def self.cost
    cost = rand(10..100)
    return cost
  end

end
