class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :poll
  enum answer: [ :yes, :no ]
end
