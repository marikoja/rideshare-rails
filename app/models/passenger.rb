class Passenger < ApplicationRecord

  has_many :trips, -> { order(date: :desc) } ,dependent: :destroy

  validates :name,  uniqueness: {message: "passenger name is already in our system!"}

  validates :name, presence: {message: 'Please provide a valid name.'}
  validates :phone_num, presence: {message: 'Please provide a valud phone number.'}

# Calculate total cost of trip
  def total_cost
    total_cost = 0
    trips.each do |trip|
      total_cost += trip.cost
    end
    return total_cost/100.round(2)
  end
end
