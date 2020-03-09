class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :questions
  has_many :answers
  has_many :question_bookmarks
  has_many :answer_bookmarks
end
