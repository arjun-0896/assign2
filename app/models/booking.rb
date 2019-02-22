class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :tour

  after_destroy :update_tour_info

  validates :bseats, presence: true, numericality: true
  validates :bwait_list, presence: true, numericality: true
  validates :customer_id, presence: true
  validates :tour_id, presence: true
  validate :availability_validity, on: :create, on: :update


  def availability_validity
    @current_tour = Tour.find(:tour_id)

    if (:bseats.present? && @current_tour.seats < :bseats)
      errors.add(:expiration_date, "can't be in the past")
    end

  end

  def availability_validity
    @current_tour = Tour.find(:tour_id)
      

  end

end
