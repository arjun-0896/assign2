class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :tour

  after_destroy :update_tour_info
  after_create :update_tour_info
  after_update :update_tour_info

  validates :bseats, presence: true, numericality: true
  validates :bwait_list, presence: true, numericality: true
  validates :customer_id, presence: true
  validates :tour_id, presence: true
  validate :availability_validity, on: :create, on: :update


  def availability_validity
    current_tour = Tour.find(tour_id)

    if (:bseats.present? && current_tour.seats < :bseats)
      errors.add(:expiration_date, "can't be in the past")
    end

  end

  def availability_update
    current_tour = Tour.find(tour_id)

    if (:bseats.present? && current_tour.seats < :bseats)
      errors.add(:expiration_date, "can't be in the past")
    end

  end

  def update_tour_info
    update_count()
    update_bookings()
  end

  def update_count
    seats = 0
    waitlist = 0

    Booking.all.each do |booking|

      if booking.tour_id == :tour_id
        seats += booking.bseats
        waitlist += booking.bwait_list
      end
      ToursController.setcount(tour_id,seats,waitlist)

    end
  end

  def update_bookings

    Booking.all.each do |booking|

      if booking.tour_id == :tour_id && booking.bwait_list < ToursController.getseats(tour_id)

        booking.bseats += booking.bwait_list
        booking.bwait_list = 0
        update_tour_info()
      end

    end
  end

end
