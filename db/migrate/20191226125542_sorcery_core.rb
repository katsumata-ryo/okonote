class SorceryCore < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :email,            null: false
      t.string :crypted_password
      t.string :salt

      t.timestamps                null: false
    end

    add_index :accounts, :email, unique: true
  end
end
