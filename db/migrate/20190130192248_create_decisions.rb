class CreateDecisions < ActiveRecord::Migration[5.2]
  def change
    create_table :decisions do |t|
      t.references :user
      t.references :round_question
      t.references :choice
      t.boolean :correct, default: false
      t.timestamps
    end
  end
end
