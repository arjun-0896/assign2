class Agent < ApplicationRecord
  has_secure_password
  has_many :tours, dependent: :destroy

  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :name, presence: true

  validates :password_digest, presence: true, length: {minimum: 8}
end
