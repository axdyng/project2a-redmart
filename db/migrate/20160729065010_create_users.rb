class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :email,           null: false
      t.string  :password_digest, null: false
      t.string  :first_name
      t.string  :last_name
      t.integer :contact_number

      t.timestamps
    end
  end
end
