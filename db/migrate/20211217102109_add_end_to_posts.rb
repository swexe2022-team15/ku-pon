class AddEndToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :end_on, :date
  end
end
