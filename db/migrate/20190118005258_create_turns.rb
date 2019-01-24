class CreateTurns < ActiveRecord::Migration[5.2]
  def change
    create_table :turns do |t|
      t.references :guest
      t.references :round
      t.references :question
      t.boolean :correct
      t.timestamps
    end
  end
end
