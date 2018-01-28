class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :user_id, null: false
      t.integer :poll_id, null: false
      t.integer :option

      t.timestamps
    end
  end
end
