class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w.+-]+@\w+\.\w+\z/, message: "email does not match required format" }

    has_many :articles
end