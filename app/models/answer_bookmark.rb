class AnswerBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :answer
end
