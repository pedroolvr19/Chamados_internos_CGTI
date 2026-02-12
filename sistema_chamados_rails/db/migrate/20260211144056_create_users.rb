class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email_address
      t.string :password_digest
      t.integer :role

      t.timestamps
    end
  end
end
