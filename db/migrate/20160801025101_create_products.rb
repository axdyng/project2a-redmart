class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string   :imgurl
      t.string   :name,       null: false
      t.decimal  :price,      null: false, precision: 10, scale: 2
      t.text     :description

      t.timestamps
    end
  end
end
