class Corporate < ApplicationRecord
    has_secure_password validations: true
    
    before_save {self.name=name.downcase}
    validates :name,presence: true
    validates :password,presence: true
    
    def self.new_remember_token
        SecureRandom.urlsafe_base64
    end
    def self.encrypt(token)
        Digest::SHA256.hexdigest(token.to_s)
    end
end
