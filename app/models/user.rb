class User < ActiveRecord::Base
  set_table_name "user_lists"
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first,:last,:is_admin
  # attr_accessible :title, :body
  
  has_one :secret_code
  accepts_nested_attributes_for :secret_code
  
  def self.create_user_with_secret_code(user_params,secret_code)
    
    User.transaction do
      user = User.create!(user_params)
      secret_code.update_attributes(:user_id => user.id)
    end
  return self
  end
end
