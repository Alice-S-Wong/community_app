class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :answer_bookmarks

  def friendly_datetime
    datetime = self.created_at
    datetime = datetime.strftime("%A, %d %b %Y %l:%M %p")
  end
end
