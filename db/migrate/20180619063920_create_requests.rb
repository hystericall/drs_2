class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :type
      t.text :content
      t.integer :status, default: 0
      t.date :date
      t.time :time
      t.date :offset_date
      t.time :offset_time_start
      t.time :offset_time_end
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :requests, [:user_id, :created_at]
  end
end
