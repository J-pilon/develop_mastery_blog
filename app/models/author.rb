class Author < ApplicationRecord
    validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w.+-]+@\w+\.\w+\z/ }

    has_many :articles
end