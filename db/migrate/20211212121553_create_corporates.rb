class CreateCorporates < ActiveRecord::Migration[5.2]
  def change
    create_table :corporates do |t|
      t.string :name, null: false
      t.string :password_digest
      t.string :remember_token

      t.timestamps
    end
  end
end
