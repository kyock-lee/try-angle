class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|

      t.timestamps
      t.references :user,               null: false, foreign_key: true
      t.date       :date,               null: false
      t.text       :description,        null: false
    end
  end
end
