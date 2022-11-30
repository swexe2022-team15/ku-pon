class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates_uniqueness_of :post_id, :user_id
end
