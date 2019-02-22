class Customer < ApplicationRecord
  has_secure_password
  dependent :destroy

  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :name, presence: true

  validates :password, presence: true, length: {minimum: 8}
end
