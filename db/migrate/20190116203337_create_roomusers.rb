class CreateRoomusers < ActiveRecord::Migration[5.2]
  def change
    create_table :roomusers do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :room, foreign_key: true

      t.timestamps
    end
  end
end
