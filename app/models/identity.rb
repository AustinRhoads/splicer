class Identity < OmniAuth::Identity::Models::ActiveRecord
   # attr_accessible :email, :name, :password_digest, :password_confirmation, :password
    
    validates :email, :uniqueness => true
    has_secure_password
end
