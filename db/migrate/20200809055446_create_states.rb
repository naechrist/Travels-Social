class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :place
      t.string :description
      t.belongs_to :country, foreign_key: true 
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
