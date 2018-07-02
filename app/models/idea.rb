class Idea < ApplicationRecord
  before_validation :delete_space
  validates :idea_content, length: { in: 1..30 }, uniqueness: { case_sensitive: false }

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

private
  def delete_space
    idea_content.gsub!(" ", "")
  end
end
