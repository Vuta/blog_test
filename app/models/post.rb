class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: {minimum: 8, maximum:  255}
  validates :content, presence: true, length: {maximum:  1000}
end
