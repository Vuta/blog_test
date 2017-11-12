class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :username, presence: true, length: {minimum: 8, maximum: 50}
  validates :email, presence: true, , length: {maximum: 255}, uniqueness: {case_sensitive: false},  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
