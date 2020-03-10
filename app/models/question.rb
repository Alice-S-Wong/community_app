class Question < ApplicationRecord
  belongs_to :user
  has_many :question_bookmarks
  has_many :answers

  def friendly_datetime
    datetime = self.created_at
    datetime = datetime.strftime("%A, %d %b %Y %l:%M %p")
  end
end
