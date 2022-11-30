class Post < ApplicationRecord
    belongs_to :user, optional: true

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    
    validates :start_on,presence: true
    validates :end_on,presence: true
    
    enum status: {open: 0,closed: 1}
end