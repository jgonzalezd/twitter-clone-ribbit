class Ribbitmsg < ActiveRecord::Base
  default_scope order: 'created_at DESC'
  attr_accessible :content
  belongs_to :user
  
  validates :content, length: {maximum: 140}
  validates :user_id, presence: true
end
