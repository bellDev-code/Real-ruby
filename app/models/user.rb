class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # 입력받은 문자열의 해시값을 리턴
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  # 추가 #

  # 랜덤한 토근을 생성하여 리턴
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 영속적인 세션을 위해 유저를 데이터베이스에 기록한다.
  def remember
    self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 입력받은 토큰이 Digest와 일치하면 true를 리턴한다.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # 유저의 로그인 정보를 파기한다.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
