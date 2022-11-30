class User < ApplicationRecord

    has_many :tweets
    has_secure_password
    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_posts, through: :likes, source: :posts
    
    before_save {self.email=email.downcase}
    validates :age,presence: true
    validates :gender,presence: true
    validates :email, presence: true
    validates :password,presence: true
    validates :password_confirmation,presence: true
    
    def self.new_remember_token
        SecureRandom.urlsafe_base64
    end
    def self.encrypt(token)
        Digest::SHA256.hexdigest(token.to_s)
    end
    def already_liked?(post)
        self.likes.exists?(post_id: post.id)
    end
end
