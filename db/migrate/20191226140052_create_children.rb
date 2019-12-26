class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.references :account, null: false, foreign_key: true
      t.string :name, null: false
      t.date :birthday, null: false

      t.timestamps
    end
  end
end
