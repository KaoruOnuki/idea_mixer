class User < ApplicationRecord
  before_save { name.downcase! }
  validates :name, presence: true, length: { in: 1..30 }

  has_secure_password
  validates :password, length: { minimum: 6 }
end
