class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :tour

  validates :bseats, presence: true, numericality: true
  validates :bwait_list, presence: true, numericality: true
  validates :customer_id, presence: true
  validates :tour_id, presence: true
  validate :availability_validity

  after_destroy :update_tour_info
  after_create :update_tour_info
  after_update :update_tour_info


  def availability_validity

    cseats = 0
    Booking.all.each do |booking|

      if booking != nil && booking.tour_id == tour_id && booking.id.to_s != id.to_s
        cseats += booking.bseats
      end
    end

    cseats += bseats
    diff = cseats - Tour.find(tour_id).seats

    if (diff > 0)
      errors.add(:sorry, "The Tour has #{diff} seats shorter than your request !")
      errors.add(:but, "You can add the addtional seats in waitlist ! You will be notified if it gets confirmed :)")
    end

  end

  def update_tour_info
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

      if booking.tour_id == tour_id && booking.bwait_list > 0 && booking.bwait_list <= difference
        useats = booking.bwait_list + booking.bseats
        difference -= booking.bwait_list
        booking.update_attribute(:bseats, useats)
        booking.update_attribute(:bwait_list, zerowaitlist)
      end

    end

    Booking.all.each do |booking|
      if booking.tour_id == tour_id
        uwaitlist += booking.bwait_list
      end
      Tour.find(tour_id).update_attribute(:wait_list,uwaitlist)
    end

  end

end
