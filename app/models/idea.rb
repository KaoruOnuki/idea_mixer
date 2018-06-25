class Idea < ApplicationRecord
  before_validation :delete_space
  validates :idea_content, length: { in: 1..30 }, uniqueness: { case_sensitive: false }

private
  def delete_space
    idea_content.gsub!(" ", "")
  end
end
