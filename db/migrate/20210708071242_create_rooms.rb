class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|

      t.timestamps
      
      t.references :user
      t.integer :genre_id
      t.string :name
      t.boolean :room_status, default: true

    end
  end
end




