class Post < ApplicationRecord

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbait

  GOODTITLES = ["Won't Believe", "Secret", "Top [#{number}]", "Guess"]

  def clickbait
    # byebug 
    unless title.match?(/GOODTITLES/)
      errors.add(:title, "Not enough clickbait") 
    end
  end

end
