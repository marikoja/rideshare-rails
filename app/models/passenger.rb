class Passenger < ApplicationRecord
  has_many :trips

  validates :phone_num, presence: true
  validates :name, presence: true, uniqueness: {message: "passenger name is already in our system!"}

  def total_cost
    total_cost = 0

    self.trips.each do |trip|
      if trip.rating != nil
        total_cost += trip.cost
      end
    end

    return total_cost
  end


end
