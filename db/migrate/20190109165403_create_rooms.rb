class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :community, foreign_key: true
      t.string :name
      t.integer :occupancy

      t.timestamps
    end
  end
end
