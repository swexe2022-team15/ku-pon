class AddStartToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :start_on, :date
  end
end
