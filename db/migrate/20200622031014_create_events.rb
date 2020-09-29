class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.text :address
      t.text :features
      t.float :price

      t.timestamps
    end
  end
end
