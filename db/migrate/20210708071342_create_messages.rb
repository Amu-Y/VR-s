class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

      t.references :user
      t.references :room
      t.string :body
      t.string :image_id

      t.timestamps
    end
  end
end
