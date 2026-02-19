class User < ApplicationRecord
  has_secure_password

  enum :role, { admin: 0, viewer: 1 }, default: :viewer

  validates :email_address, presence: true, uniqueness: true
end
