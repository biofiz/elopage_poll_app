class PollPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

    def show?
    record.user == user
  end

  def edit?
    show? && record.answers.empty?
  end

  def update?
    edit?
  end

  def vote?
    record.answers.where(user: user).empty?
  end
end
