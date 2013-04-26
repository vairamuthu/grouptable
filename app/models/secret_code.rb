class SecretCode < ActiveRecord::Base
   attr_accessible :user_id, :code
   belongs_to :user

def self.get_for_signup(code)
  find(:first, :conditions => ["code =? and (user_id is null or user_id = 0)", code])
end
end
  