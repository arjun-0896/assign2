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

    cseats = 0
    Booking.all.each do |booking|

      if booking.tour_id == tour_id
        cseats += booking.bseats
      end
    end

    if (:bseats.present? && Tour.find(tour_id).seats < cseats)
      errors.add(:availability, "Seats not available")
    end

  end

  def update_tour_info
    update_count()
  end

  def update_count
    cseats = 0
    cwaitlist = 0

    Booking.all.each do |booking|

      if booking.tour_id == tour_id
        cseats += booking.bseats
        cwaitlist += booking.bwait_list
      end

      Tour.find(tour_id).update_attribute(:wait_list,cwaitlist)
    end

    difference = Tour.find(tour_id).seats - cseats

    zerowaitlist = 0
    uwaitlist = 0

    Booking.all.each do |booking|
      if booking.tour_id == :tour_id

        if booking.bwait_list < difference
          useats = booking.bwait_list + booking.bseats
          difference -= booking.bwait_list
          Booking.find(booking.tour_id).update_attribute(:bseats, useats)
          Booking.find(booking.tour_id).update_attribute(:bwait_list, zerowaitlist)
        end
        uwaitlist += booking.bwait_list
      end
    end
    Tour.find(tour_id).update_attribute(:wait_list,cwaitlist)

  end

end
