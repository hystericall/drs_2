class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.index :email, unique: true
      t.references :division, foreign_key: true
      t.references :position, foreign_key: true
      t.string :skill
      t.string :user_code
      t.index :user_code, unique: true
      t.integer :role, null: false, default: 0
      t.timestamps
    end
  end
end
