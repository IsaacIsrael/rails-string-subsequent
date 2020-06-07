class CreateCalculations < ActiveRecord::Migration[5.2]
  def change
    create_table :calculations do |t|
      t.string :string_a, null: false
      t.string :string_b, null: false
      t.boolean :result, null: false
      t.integer :substrings, array: true, default: []
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
