class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attributes accessible
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :id
  
  #active record relationships
  has_many :comments
  
end
