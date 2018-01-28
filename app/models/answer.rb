class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :poll

  validates_presence_of :option
end
