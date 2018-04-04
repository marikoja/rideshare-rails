class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :phone, presence: true

  # def total_cost
  #   count = 0
  #   #if loop for new riders with no trips, think about proper exception handling instead of returning nil
  #
  #     total = @trips.map {|trip| trip.cost}.reduce(:+) / 100.0
  #     return '%.02f' % total
  #
  # end


  # def start_trip
  #   # if Driver.available.count < 1
  #   #   return false
  #   # elsedef find_driver_ids
  #
  #
  #     new_trip = Trip.new(passenger:self, driver: Driver.ids.sample, cost:rand(100..15000), rating: 0, date: Date.today)
  #
  #     trips << new_trip
  #
  #   return new_trip
  # end
end
