class CreateDecisions < ActiveRecord::Migration[5.2]
  def change
    create_table :decisions do |t|
      t.references :guest
      t.references :round
      t.references :question
      t.boolean :correct
      t.timestamps
    end
  end
end
