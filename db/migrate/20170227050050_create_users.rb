class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :is_admin, default: false
      t.string :email,                null: false
      t.string :password_digest,      null: false
      t.string :password_reset_token, null: false, limit: 60

      t.timestamps
    end
  end
end
