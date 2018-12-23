require 'openssl'
class User < ApplicationRecord
  before_validation { username.downcase! if username }

  ITERATION = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions, dependent: :destroy
  has_many :own_questions, class_name: 'Question',
           foreign_key: 'author_id', dependent: :nullify

  validates :email, presence: true, uniqueness: true,
            email: true

  # Проверяет валидность username
  validates :username, presence: true, uniqueness: true,
            length: {maximum: 40}, username: true

  # Проверяет валидность формата цвета 16-ричной системе
  validates :bg_color, hex_color: true

  attr_accessor :password
  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_save :encrypt_password

  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATION, DIGEST.length, DIGEST)
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    if user.present? && user.password_hash == User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATION, DIGEST.length, DIGEST)
    )
      user
    else
      nil
    end
  end
end

