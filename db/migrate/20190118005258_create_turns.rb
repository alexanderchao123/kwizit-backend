class CreateTurns < ActiveRecord::Migration[5.2]
  def change
    create_table :turns do |t|
      t.references :user
      t.references :round
      t.references :choice
      t.timestamps
    end
  end
end
