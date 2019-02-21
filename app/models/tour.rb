class Tour < ApplicationRecord
  belongs_to :agent
  has_many :reviews
  has_many :bookings

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :description, presence: true
  validates :photos, presence: true
  validates :price, presence: true, numericality: true
  validates :booking_date_validity, on: :create, on: :update
  validates :valid_start_date, on: :create, on: :update
  validates :valid_end_date, on: :create, on: :update
  validates :start_location, presence: true
  validates :contact_agent, presence: true
  validates :status, presence:true, inclusion: { in: %w(InFuture Completed Cancelled)}

  def booking_date_validity
    if (:booking_deadline.present? && :booking_deadline < Date.today)
      errors.add(:expiration_date, "can't be in the past")
    end
  end

  def valid_start_date
    if (:from_date.present? && :from_date < Date.today)
      errors.add(:start_date, "can't be in the past")
    end
  end

  def valid_end_date
    if :to_date.present? && :to_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end
end
