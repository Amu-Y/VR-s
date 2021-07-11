class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
