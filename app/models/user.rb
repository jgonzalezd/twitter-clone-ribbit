class User < ActiveRecord::Base
  has_many :ribbitmsgs
  has_secure_password
  attr_accessible :avatar_url, :email, :password, :password_confirmation, :username
  
  before_validation :prep_email
  before_save :create_avatar_url
  
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A[\w.+-]+@([\w]+.)+\w+\z/ }
  
  private
 
    def prep_email
        self.email = self.email.strip.downcase if self.email
    end
    
    def create_avatar_url
        self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
    end
  
end
