class User < ApplicationRecord
    has_secure_password

    has_many :lessons
    has_many :comments, through: :lessons

    validates :name,  uniqueness: true
    validates :name,  presence: true
    validates :email, presence: true, uniqueness: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.name = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end

end
