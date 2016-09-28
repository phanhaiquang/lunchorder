class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :orders
    has_many :dishes, through: :orders
    
  has_many :orders, dependent: :destroy
  
  def name
      email.gsub(/@.*/, '')
  end
end
