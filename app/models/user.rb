class User < ApplicationRecord
    has_secure_password

    has_many :lessons
    has_many :comments, through: :lessons

    validates :name,  uniqueness: true
    validates :name,  presence: true
    validates :email, presence: true, uniqueness: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
