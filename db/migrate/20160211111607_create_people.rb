class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :email
      t.string :password_digest
      t.string :authentication_token

      t.timestamps null: false
    end
  end
end
