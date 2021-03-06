class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.integer :room_id
      t.integer :message_id
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end

    add_index :notifications, :sender_id
    add_index :notifications, :receiver_id
    add_index :notifications, :room_id
    add_index :notifications, :message_id
  end
end
