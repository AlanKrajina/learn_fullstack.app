class User < ApplicationRecord
    has_secure_password
    validates :name,  uniqueness: true
    validates :name,  presence: true
    validates :email, presence: true, uniqueness: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
