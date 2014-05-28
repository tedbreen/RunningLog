# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#  session_token   :string(255)      not null
#  fname           :string(255)      not null
#  lname           :string(255)      not null
#  state           :string(255)      not null
#  city            :string(255)      not null
#  gender          :integer          not null
#  avatar          :string(255)      not null
#

class User < ActiveRecord::Base
  attr_reader :password

  before_validation :ensure_session_token

  validates :email, :presence => true
  validates :password_digest, :presence => true
  validates :password, :length => { :minimum => 1, :allow_nil => true }
  validates :session_token, :presence => true
  validates :gender, :presence => true
  validates :avatar, :presence => true

  has_many(
    :runs,
    :class_name => "Run",
    :foreign_key => :user_id,
    :inverse_of => :user
  )


  def password=(password)
    @password = password  # this is for minimum length
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    @user = User.find_by_email(email)
    return nil if @user.nil?
    @user.is_password?(password) ? @user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end



end
