class CreateRoundQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :round_questions do |t|
      t.references :round
      t.references :question
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
