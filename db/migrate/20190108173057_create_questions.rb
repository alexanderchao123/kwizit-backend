class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :quiz
      t.string :title
      t.string :difficulty
      t.timestamps
    end
  end
end
