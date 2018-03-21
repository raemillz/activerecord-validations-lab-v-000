class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  CLICKBAIT_OPTIONS = ["Won't Believe",
                      "Secret",
                      "Top [number]",
                      "Guess"]
  def clickbait
    unless CLICKBAIT_OPTIONS.any? {|c| c.match title}
      false
    end
  end

end
