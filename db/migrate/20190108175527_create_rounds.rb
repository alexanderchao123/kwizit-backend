class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.references :host
      t.references :quiz
      t.integer :pin, unique: true
      t.boolean :complete, default: false
      t.timestamps
    end
  end
end
