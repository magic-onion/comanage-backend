class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :community, foreign_key: true
      t.integer :likes
      t.integer :boos
      t.string :body

      t.timestamps
    end
  end
end
