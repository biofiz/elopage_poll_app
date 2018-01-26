class AddAnswerOptionsToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :answer_options, :string, array: true, default: []
  end
end
