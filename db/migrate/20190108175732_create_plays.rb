class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|
      t.references :user
      t.references :round
      t.timestamps
    end
  end
end
