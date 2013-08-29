class User < ActiveRecord::Base
  attr_accessible :avatar_url, :email, :name, :password, :password_confirmation
  has_secure_password
  
  before_validation :prep_email
  
  validates_presence_of :name
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /^[\w.+-]+@([\w]+.)+\w+$/ }
  
  private
 
    def prep_email
        self.email = self.email.strip.downcase if self.email
    end
  
end
