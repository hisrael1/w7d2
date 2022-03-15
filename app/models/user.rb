#FIGVAPER!!!
class User < ApplicationRecord

  before_validation :ensure_session_token
  validates :username, :password_digest, :session_token, presence: true
  validates :username, uniqueness: true
  #why isn't this done?
  #validates :username, :session_token, :password_digest, uniqueness: true

  #dont forget attr_reader!!!
  attr_reader :password
   
  def self.find_by_credentials(username, password)
    #return the user searched by username
    user = User.find_by(username: username)
    #is there a user and is this users password the same as the password in arguement
    if user && user.is_password?(password)
      return user
    else
      return nil
    end
  end

  def is_password?(password)
    #The native is_password? method checks if the password digest is = to password arguement
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def password=(password)
    #why is it this? Is it getting saved like an object? What are the ::?
    #How do we know when we need self in the begining? 
    #How can we differentiate between the class and instance methods
    @password = password
    user.password_digest = BCrypt::Password.create(@password)
    #password_digest = BCrypt::Password.create(@password)
  end

  def ensure_session_token
    #what is this doing?
    self.session_token = User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    #self.session_token = nil
    self.session_token
  end

end