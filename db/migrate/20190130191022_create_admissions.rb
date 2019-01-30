class CreateAdmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :admissions do |t|
      t.references :guest
      t.references :round
      t.timestamps
    end
  end
end
