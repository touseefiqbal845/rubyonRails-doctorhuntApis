class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :role, null: false, default: "user"
      t.string :reset_password_token, default: ""
      t.timestamps
    end
  end
end
