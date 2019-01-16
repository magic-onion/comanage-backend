class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.references :community, foreign_key: true
      t.string :name
      t.date :birthday
      t.string :status
      t.string :image
      t.boolean :assigned
      t.string :bio

      t.timestamps
    end
  end
end
