class Card < ApplicationRecord
  validates :content, length: { in: 1..15 }, uniqueness: { case_sensitive: false }
end
