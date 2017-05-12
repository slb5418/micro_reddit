class User < ApplicationRecord
	validates :username, presence: true, length: {maximum: 50}
	validates :password, presence: true, length: { minimum: 6 }
	has_secure_password

	has_many :posts
	has_many :comments
end
