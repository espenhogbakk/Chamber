class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  
  validates_presence_of :email, :first_name, :last_name
  
  has_many :messages
  
  has_many :rooms, :through => :participants
  
  
  def serializable_hash(options = nil)    
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      full_name: full_name,
      email: email,
    }
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
end
