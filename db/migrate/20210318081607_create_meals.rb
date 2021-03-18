class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|

      t.timestamps
      t.references :user,               null: false, foreign_key: true
      t.date       :date,               null: false
      t.text       :description
    end
  end
end
