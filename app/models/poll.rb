class Poll < ApplicationRecord
  belongs_to :user
  has_many :answers

  validates_presence_of :title, :user_id
end
