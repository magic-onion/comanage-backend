class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.references :community, foreign_key: true
      t.string :name
      t.date :birthday
      t.string :status
      t.boolean :assigned
      t.date :assignment_start
      t.date :assignment_end
      t.string :bio

      t.timestamps
    end
  end
end
