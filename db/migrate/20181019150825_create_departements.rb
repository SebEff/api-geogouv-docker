class CreateDepartements < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :code
      t.string :name
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
