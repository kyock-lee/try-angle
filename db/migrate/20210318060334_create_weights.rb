class CreateWeights < ActiveRecord::Migration[6.0]
  def change
    create_table :weights do |t|

      t.timestamps
    end
  end
end
