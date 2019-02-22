class Customer < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :name, presence: true

  validates :password, presence: true, length: {minimum: 8}
end
