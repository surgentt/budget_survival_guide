class User < ActiveRecord::Base
  has_many :budgets

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, unless: :guest?

  has_secure_password(validations: false)
  validates :password, presence: true, length: { minimum: 6 }, unless: :guest?

  def self.create_guest
    @user = User.create(email: "guest@gmail.com", password: "guestuser", guest: true)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
