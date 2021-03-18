class CreateWeights < ActiveRecord::Migration[6.0]
  def change
    create_table :weights do |t|

      t.timestamps
      t.references :user,               null: false, foreign_key: true
      t.integer    :weight,             null: false
      t.date       :date,        null: false
    end
  end
end
