class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :place
      t.string :description
      t.boolean :pet_friendly
      t.belongs_to :state, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
