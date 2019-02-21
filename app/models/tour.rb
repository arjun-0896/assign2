class Tour < ApplicationRecord
  has_and_belongs_to_many :customers

  #validates :id, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :description, presence: true
  #validates :photos, presence: true
  #mount_uploader :image, ImageUploader
  serialize :image, JSON
  validates :price, presence: true, numericality: true
  #validates :booking_date_validity, presence: true, on: :create, on: :update
  validates :booking_deadline, presence: true
  #validates :valid_start_date, presence: true, on: :create, on: :update
  validates :from_date, presence: true
  #validates :valid_end_date, presence: true, on: :create, on: :update
  validates :to_date, presence: true
  validates :start_location, presence: true
  #validates :contact_agent, presence: true
  validates :status, presence:true, inclusion: { in: %w(InFuture Completed Cancelled)}
  end
