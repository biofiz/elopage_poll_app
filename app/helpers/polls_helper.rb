module PollsHelper
  def votes_amount(answers, index)
    "#{pluralize(answers[index] ||= 0, 'vote')}"
  end
end
