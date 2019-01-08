class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.references :quiz
      t.integer :pin, unique: true
      t.timestamps
    end
  end
end
