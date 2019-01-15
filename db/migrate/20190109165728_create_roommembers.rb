class CreateRoommembers < ActiveRecord::Migration[5.2]
  def change
    create_table :roommembers do |t|
      t.references :member, foreign_key: true
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
