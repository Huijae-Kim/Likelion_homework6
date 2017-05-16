class User < ActiveRecord::Base
  rolify
    has_secure_password
    has_many :contents
    
    validates :email, uniqueness: true
    validates :nickname, uniqueness: true
    # validation_uniqueness_of :email
end
