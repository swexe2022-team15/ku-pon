class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :status, default: 0
      t.integer :limit

      t.timestamps
    end
  end
end
