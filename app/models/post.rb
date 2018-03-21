class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  clickbait_options = ["Won't Believe",
                      "Secret",
                      "Top [number]",
                      "Guess"]
  def clickbait
    @post = Post.find(:id)
    unless (@post.title.chars-clickbait_options).any?
      false
    end
  end

end
