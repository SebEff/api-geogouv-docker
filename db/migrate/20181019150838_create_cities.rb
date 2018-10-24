class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :code
      t.string :name
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
