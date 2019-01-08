class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.references :creator
      t.string :title, unique: true
      t.text :description
      t.timestamps
    end
  end
end
