class Poll < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy

  validates_presence_of :title
  validate :minimum_number_of_answer_options

  before_create :assign_uuid

  private

  def assign_uuid
    self.uuid = SecureRandom.uuid
  end

  def minimum_number_of_answer_options
    errors.add(:answer_options, "should be at least 2 options") if self.answer_options.length < 2
  end
end
