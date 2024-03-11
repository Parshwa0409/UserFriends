class User < ApplicationRecord

    has_many :friends

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "THE EMAIL ADDRESS MUST BE VALID EMAIL"}
    validates :password, presence: true, format: {with: /.{8,}/, message: "THE PASSWORD MUST BE MINIMUM 8 CHARACTERS"}
    validates :password_confirmation, presence: true

end
