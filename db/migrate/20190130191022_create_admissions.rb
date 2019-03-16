class CreateAdmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :admissions do |t|
      t.references :user
      t.references :round
      t.integer :score, default: 0
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
