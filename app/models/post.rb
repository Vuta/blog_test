class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: {minimum: 8, maximum:  255}
  validates :content, presence: true, length: {minimum:  20}

  def self.search(title, user_id)
    if title && user_id
      where("title LIKE ? AND user_id = ?", "%#{title}%", "#{user_id}")
    else
      where("title LIKE ? OR user_id = ?", "%#{title}%", "#{user_id}")
    end
  end
end
