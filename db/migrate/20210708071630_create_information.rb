class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|

      t.string :name
      t.string :link
      t.text :body
      t.decimal :score, precision: 5, scale: 3

      t.timestamps
    end
  end
end
